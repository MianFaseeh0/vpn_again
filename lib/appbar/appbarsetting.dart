import 'package:flutter/material.dart';

import 'package:vpnapp/appbar/appbarbuttons.dart';
import 'package:vpnapp/appbar/searchbar.dart';

class AppbarSettings extends StatelessWidget {
  const AppbarSettings({super.key});

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 32, top: 14.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              Appbarbuttons(
                color: Color(0xFF3B74FF),
                path: 'assets/images/login-screen/category-2.svg',
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
              Appbarbuttons(
                color: Color(0xFF3B74FF),
                path: 'assets/images/login-screen/crown.svg',
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: const Searchbar(),
          ),
        ],
      ),
    );
  }
}
