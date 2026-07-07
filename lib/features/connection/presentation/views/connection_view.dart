import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vpnapp/features/connection/domain/state/vpn_connection_state.dart';
import 'package:vpnapp/features/connection/presentation/providers/connection_providers.dart';
import 'package:vpnapp/features/connection/presentation/widgets/cancel_disconnect_button.dart';
import 'package:vpnapp/features/connection/presentation/widgets/change_server_button.dart';
import 'package:vpnapp/features/connection/presentation/widgets/connecting_state_view.dart';
import 'package:vpnapp/features/connection/presentation/widgets/connection_summary_card.dart';
import 'package:vpnapp/features/connection/presentation/widgets/initial_state_view.dart';
import 'package:vpnapp/features/connection/presentation/widgets/message_bar_connected.dart';
import 'package:vpnapp/features/connection/presentation/widgets/message_bar_connecting.dart';

class ConnectionView extends ConsumerStatefulWidget {
  const ConnectionView({required this.onChangeServer, super.key});

  final VoidCallback onChangeServer;

  @override
  ConsumerState<ConnectionView> createState() => _ConnectionViewState();
}

class _ConnectionViewState extends ConsumerState<ConnectionView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulseController;
  late final Animation<double> _pulseAnimation;

  static const _progressIndicator = Align(
    alignment: Alignment.center,
    child: SizedBox(
      height: 185,
      width: 185,
      child: CircularProgressIndicator(color: Colors.red),
    ),
  );

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 0.99, end: 1.03).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInCubic),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final connectionState = ref.watch(connectionViewModelProvider);
    final isBusyOrActive =
        connectionState is VpnConnecting || connectionState is VpnConnected;
    final isFullyConnected = connectionState is VpnConnected;

    return SizedBox(
      height: 900,
      width: 500,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: AnimatedBuilder(
              animation: _pulseController,
              builder: (ctx, child) =>
                  Transform.scale(scale: _pulseAnimation.value, child: child),
              child: Container(
                height: 230,
                width: 230,
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      Color.fromARGB(130, 72, 217, 186),
                      Color.fromARGB(122, 72, 217, 186),
                      Color.fromARGB(112, 72, 217, 186),
                      Color.fromARGB(116, 72, 217, 186),
                      Color.fromARGB(110, 72, 217, 186),
                      Color.fromARGB(0, 255, 255, 255),
                    ],
                    center: Alignment.center,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: AnimatedBuilder(
              animation: _pulseController,
              builder: (ctx, child) =>
                  Transform.scale(scale: _pulseAnimation.value, child: child),
              child: SvgPicture.asset('assets/DISCONNECT/globe.svg'),
            ),
          ),
          if (isBusyOrActive && !isFullyConnected) _progressIndicator,
          AnimatedPositioned(
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOutCubic,
            top: isFullyConnected ? 295 : 270,
            bottom: isFullyConnected ? 288 : 270,
            left: isFullyConnected ? 180 : 60,
            right: isFullyConnected ? 50 : 60,
            child: SvgPicture.asset('assets/DISCONNECT/pin.svg'),
          ),
          if (isBusyOrActive)
            Positioned(
              top: 320,
              bottom: 235,
              left: 235,
              right: 10,
              child: switch (connectionState) {
                VpnConnected(:final country) => MessageBarConnected(
                  countryName: country.name,
                  ipAddress: country.ipAddress,
                ),
                _ => const MessageBarConnecting(),
              },
            ),
          Align(alignment: Alignment.center, child: _content(connectionState)),
        ],
      ),
    );
  }

  Widget _content(VpnConnectionState state) {
    final notifier = ref.read(connectionViewModelProvider.notifier);

    return switch (state) {
      VpnDisconnected() => const InitialStateView(),
      VpnConnecting(:final country) => ConnectingStateView(
        country: country,
        onCancel: notifier.disconnect,
      ),
      VpnConnected(:final country, :final elapsedSeconds) => ConnectionSummaryCard(
        country: country,
        elapsedSeconds: elapsedSeconds,
        downloadLabel: '300MB',
        uploadLabel: '34MB',
        footerText: '',
        footerButton: CancelDisconnectButton(
          label: 'Cancel Connection',
          onPressed: notifier.disconnect,
        ),
      ),
      VpnJustDisconnected(:final country) => ConnectionSummaryCard(
        country: country,
        elapsedSeconds: 0,
        downloadLabel: '300MB',
        uploadLabel: '34MB',
        footerText: 'Disconnected',
        footerButton: ChangeServerButton(onPressed: widget.onChangeServer),
      ),
    };
  }
}
