import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vpnapp/Widgets/connection-widgets/cancel_disconnect_button.dart';
import 'package:vpnapp/Widgets/change_server_button.dart';
import 'package:vpnapp/Widgets/connection-widgets/connected_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vpnapp/Widgets/connection-widgets/connected_state2.dart';
import 'package:vpnapp/Widgets/connection-widgets/connectin_state.dart';
import 'package:vpnapp/Widgets/connection-widgets/initial_state.dart';
import 'package:vpnapp/Widgets/connection-widgets/mess_bar_connected_state.dart';
import 'package:vpnapp/Widgets/connection-widgets/mess_bar_connecting_state.dart';
import 'package:vpnapp/providers/selected_country_button_provider.dart';
import 'package:vpnapp/providers/stopwatch_provider.dart';

enum connectionStatus { initial, connecting, connected, disconnected }

class ConnectionsScreen extends ConsumerStatefulWidget {
  const ConnectionsScreen({required this.goscreen, super.key});
  final void Function() goscreen;
  @override
  ConsumerState<ConnectionsScreen> createState() {
    return _ConnectionsScreenState();
  }
}

class _ConnectionsScreenState extends ConsumerState<ConnectionsScreen>
    with SingleTickerProviderStateMixin {
  final Map<String, connectionStatus> connectionsStates = ({
    'false-false-false': connectionStatus.initial,
    'true-false-false': connectionStatus.connecting,
    'true-true-false': connectionStatus.connected,
    'false-false-true': connectionStatus.disconnected,
  });

  late AnimationController _controller;
  late Animation<double> _animation;
  bool isDisconnected = false;

  final _progressIndicator = Align(
    alignment: Alignment.center,
    child: SizedBox(
      height: 185,
      width: 185,
      child: CircularProgressIndicator(color: Colors.red),
    ),
  );

  void disConnect() {
    final selectedCountry = ref.read(toggleButton.notifier).countryName;
    ref.read(toggleButton.notifier).toogle(selectedCountry!);
    ref.read(connectionTimerProvider.notifier).reset();
    ref.read(stopwatchProvider.notifier).toggle();
    setState(() {
      isDisconnected = true;
    });
  }

  String getStatusKey(bool isActive, bool delayConnected, bool disconnect) {
    return '$isActive-$delayConnected-$disconnect';
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 0.99,
      end: 1.03,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInCubic));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return SizedBox(
      height: 900,
      width: 500,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,

            child: AnimatedBuilder(
              animation: _controller,
              builder: (ctx, child) {
                return Transform.scale(scale: _animation.value, child: child);
              },
              child: Container(
                height: 230,
                width: 230,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      const Color.fromARGB(130, 72, 217, 186),
                      const Color.fromARGB(122, 72, 217, 186),
                      const Color.fromARGB(112, 72, 217, 186),
                      const Color.fromARGB(116, 72, 217, 186),
                      const Color.fromARGB(110, 72, 217, 186),

                      const Color.fromARGB(0, 255, 255, 255),
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
              animation: _controller,
              builder: (ctx, child) {
                return Transform.scale(scale: _animation.value, child: child);
              },
              child: SvgPicture.asset('assets/DISCONNECT/globe.svg'),
            ),
          ),
          Consumer(
            builder: (context, ref, child) {
              final isActive = ref.watch(isAnyCountryConnectedProvider);
              final delayeConnectedTime = ref.watch(connectionTimerProvider);
              return isActive && delayeConnectedTime == false
                  ? _progressIndicator
                  : Align();
            },
          ),

          Consumer(
            builder: (context, ref, child) {
              final isActive = ref.watch(isAnyCountryConnectedProvider);
              final delayeConnectedTime = ref.watch(connectionTimerProvider);

              return AnimatedPositioned(
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOutCubic,
                top: isActive && delayeConnectedTime == true ? 295 : 270,
                bottom: isActive && delayeConnectedTime == true ? 288 : 270,
                left: isActive && delayeConnectedTime == true ? 180 : 60,
                right: isActive && delayeConnectedTime == true ? 50 : 60,
                child: SvgPicture.asset('assets/DISCONNECT/pin.svg'),
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final isActive = ref.watch(isAnyCountryConnectedProvider);
              final delayeConnectedTime = ref.watch(connectionTimerProvider);
              final mess =
                  delayeConnectedTime == true
                      ? MessBarConnectedState()
                      : MessBar();
              return Positioned(
                top: 320,
                bottom: 235,
                left: 235,
                right: 10,
                child: isActive ? mess : Align(),
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final isActive = ref.watch(isAnyCountryConnectedProvider);
              final delayConnected = ref.watch(connectionTimerProvider);

              final key = getStatusKey(
                isActive,
                delayConnected,
                isDisconnected,
              );
              final status = connectionsStates[key] ?? connectionStatus.initial;

              Widget content;

              if (status == connectionStatus.connecting) {
                content = ConnectinState();
              } else if (status == connectionStatus.connected) {
                content = Connectedstate(
                  button: CancelDisconnectButton(
                    disconnect: () {
                      disConnect();
                    },
                  ),
                  text: '',
                );
              } else if (status == connectionStatus.disconnected) {
                content = Connectedstate2(
                  button: ChangeServerButton(
                    connect: () {
                      widget.goscreen();
                    },
                  ),
                  text: 'Disconnected',
                );
              } else {
                content = InitialState();
              }
              print(isActive);
              print(delayConnected);
              print(isDisconnected);

              return Align(alignment: Alignment.center, child: content);
            },
          ),
        ],
      ),
    );
  }
}
