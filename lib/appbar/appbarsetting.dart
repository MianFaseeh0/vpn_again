import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:vpnapp/appbar/appbarbuttons.dart';
import 'package:vpnapp/appbar/searchbar.dart';

class AppbarSettings extends StatelessWidget {
  const AppbarSettings({super.key});

  @override
  Widget build(context) {
    return Stack(
      clipBehavior: Clip.antiAlias,
      children: [
        Positioned(
          left: 1,
          right: 1,
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/images/login-screen/Frame.svg',
                width: MediaQuery.of(context).size.width * 0.5,
              ),

              SvgPicture.asset(
                'assets/images/login-screen/lines.svg',
                width: MediaQuery.of(context).size.width * 0.49,
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              Row(
                children: [
                  Appbarbuttons(
                    color: Color(0xFF3B74FF),
                    path: 'assets/images/login-screen/category-2.svg',
                  ),

                  const Spacer(),
                  Text(
                    'Countries',
                    style: Theme.of(
                      context,
                    ).textTheme.headlineLarge!.copyWith(color: Colors.white),
                  ),
                  const Spacer(),
                  Appbarbuttons(
                    color: Color(0xFF3B74FF),
                    path: 'assets/images/login-screen/crown.svg',
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Searchbar(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
