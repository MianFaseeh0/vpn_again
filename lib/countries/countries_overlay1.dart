import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vpnapp/countries/power_button.dart';

class CountryOverlay1 extends StatelessWidget {
  const CountryOverlay1({
    required this.countryname,
    required this.locations,
    required this.picture,
    super.key,
  });

  final String locations;
  final String countryname;
  final String picture;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, left: 30, right: 30),
      width: double.infinity,
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          SvgPicture.asset(picture, width: 42, height: 32, fit: BoxFit.cover),

          const SizedBox(width: 12),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                countryname,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                locations,
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall!.copyWith(color: Colors.black),
              ),
            ],
          ),

          Spacer(),

          // Power and Arrow buttons
          const PowerButton(icon: Icons.power_settings_new),
          const SizedBox(width: 8),
          const PowerButton(icon: Icons.arrow_forward_ios_rounded),
        ],
      ),
    );
  }
}
