import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vpnapp/providers/selected_country_button_provider.dart';

class MessBarConnectedState extends ConsumerWidget {
  const MessBarConnectedState({super.key});
  @override
  Widget build(context, WidgetRef ref) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset('assets/DISCONNECT/message.svg'),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, child) {
                final selectedCountries =
                    ref.read(toggleButton.notifier).countryName;
                return Text(
                  '$selectedCountries',
                  style: TextStyle(
                    fontFamily: 'gilroy',
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                );
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                final coOrdinates = ref.read(toggleButton.notifier).cordinates;
                return Text(
                  '$coOrdinates',
                  style: TextStyle(
                    fontFamily: 'gilroy',
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
