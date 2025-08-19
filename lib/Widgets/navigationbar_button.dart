import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:vpnapp/Widgets/screen_button.dart';

class NavigationbarButton extends StatelessWidget {
  const NavigationbarButton({
    required this.color1,
    required this.color2,
    required this.color3,
    required this.goto1,
    required this.goto2,
    required this.goto3,
    super.key,
  });

  final Color color1;
  final Color color2;
  final Color color3;

  final void Function() goto1;
  final void Function() goto2;
  final void Function() goto3;

  @override
  Widget build(cotext) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ScreenButton(
          color: color1,
          icon: LucideIcons.map,
          text: 'Countries',
          onPressed: () {
            goto1;
          },
        ),
        ScreenButton(
          color: color2,
          icon: PhosphorIcons.broadcast(),
          text: 'Disconnect',
          onPressed: () {
            goto2;
          },
        ),
        ScreenButton(
          color: color3,

          icon: PhosphorIcons.gearSix(),
          text: 'Settings',
          onPressed: () {
            goto3;
          },
        ),
      ],
    );
  }
}
