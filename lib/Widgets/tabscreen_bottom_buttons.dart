import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:vpnapp/Widgets/screen_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabscreenBottomButtons extends ConsumerWidget {
  const TabscreenBottomButtons({
    required this.currentIndex,
    required this.currentScreen0,
    required this.currentScreen1,
    required this.currentScreen2,
    super.key,
  });
  final int currentIndex;
  final void Function() currentScreen0, currentScreen1, currentScreen2;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ScreenButton(
          color:
              currentIndex == 0
                  ? const Color.fromARGB(255, 0, 71, 193)
                  : Colors.black,
          icon: LucideIcons.map,
          text: 'Countries',
          onPressed: currentScreen0,
        ),
        ScreenButton(
          color:
              currentIndex == 1
                  ? const Color.fromARGB(255, 0, 71, 193)
                  : Colors.black,
          icon: PhosphorIcons.broadcast(),
          text: 'Disconnect',
          onPressed: currentScreen1,
        ),
        ScreenButton(
          color:
              currentIndex == 2
                  ? const Color.fromARGB(255, 0, 71, 193)
                  : Colors.black,

          icon: PhosphorIcons.gearSix(),
          text: 'Settings',
          onPressed: currentScreen2,
        ),
      ],
    );
  }
}
