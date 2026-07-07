import 'package:flutter/material.dart';
import 'package:vpnapp/features/navigation/presentation/widgets/app_bar_icon_button.dart';
import 'package:vpnapp/features/navigation/presentation/widgets/country_search_bar.dart';

class CountriesAppBar extends StatelessWidget {
  const CountriesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 32, top: 14.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              const AppBarIconButton(
                backgroundColor: Color(0xFF3B74FF),
                assetPath: 'assets/images/login-screen/category-2.svg',
              ),
              const Spacer(),
              Text(
                'Countries',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              const AppBarIconButton(
                backgroundColor: Color(0xFF3B74FF),
                assetPath: 'assets/images/login-screen/crown.svg',
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: CountrySearchBar(),
          ),
        ],
      ),
    );
  }
}
