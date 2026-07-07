import 'package:flutter/material.dart';
import 'package:vpnapp/features/navigation/presentation/widgets/app_bar_icon_button.dart';

class SimpleAppBar extends StatelessWidget {
  const SimpleAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 32, top: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              const AppBarIconButton(
                backgroundColor: Color.fromARGB(26, 9, 31, 15),
                assetPath: 'assets/elseAppbar/category-2.svg',
              ),
              const Spacer(),
              Text(
                'Spectre Vpn',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              const AppBarIconButton(
                backgroundColor: Color.fromARGB(26, 9, 31, 15),
                assetPath: 'assets/elseAppbar/crown.svg',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
