import 'package:flutter/material.dart';
import 'package:vpnapp/appbar/appbarbuttons.dart';

class ElseAppbar extends StatelessWidget {
  const ElseAppbar({super.key});

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 32, top: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Appbarbuttons(
                color: Color.fromARGB(26, 9, 31, 15),

                path: 'assets/elseAppbar/category-2.svg',
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
              Appbarbuttons(
                color: Color.fromARGB(26, 9, 31, 15),
                path: 'assets/elseAppbar/crown.svg',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
