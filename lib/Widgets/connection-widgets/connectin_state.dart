import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vpnapp/Widgets/connection-widgets/cancel_disconnect_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vpnapp/providers/selected_country_button_provider.dart';

class ConnectinState extends ConsumerWidget {
  const ConnectinState({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void disConnect() {
      final selectedCountry = ref.read(toggleButton.notifier).countryName;
      ref.read(toggleButton.notifier).toogle(selectedCountry!);
      ref.read(connectionTimerProvider.notifier).reset();
    }

    return Column(
      children: [
        const SizedBox(height: 30),
        Text(
          'Status',
          style: TextStyle(
            fontFamily: 'gilroy',
            fontSize: 12,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Connecting...',
          style: TextStyle(
            fontFamily: 'gilroy',
            fontSize: 16,
            color: Color(0xFFE63946),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(13)),
          clipBehavior: Clip.hardEdge,
          child: Consumer(
            builder: (context, ref, child) {
              final pic = ref.watch(toggleButton.notifier).countryPic;
              return SvgPicture.asset('$pic', height: 32, width: 32);
            },
          ),
        ),
        const SizedBox(height: 8),
        const SizedBox(height: 4),
        Consumer(
          builder: (context, ref, child) {
            final name = ref.read(toggleButton.notifier).countryName;
            return Text(
              '$name',
              style: TextStyle(
                fontFamily: 'gilroy',
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            );
          },
        ),
        const SizedBox(height: 300),
        Consumer(
          builder: (context, ref, child) {
            return CancelDisconnectButton(disconnect: disConnect);
          },
        ),
      ],
    );
  }
}
