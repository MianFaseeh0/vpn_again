import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:vpnapp/features/navigation/presentation/providers/navigation_providers.dart';
import 'package:vpnapp/features/navigation/presentation/widgets/screen_button.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({super.key});

  static const _activeColor = Color.fromARGB(255, 0, 71, 193);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(tabIndexViewModelProvider);
    final changeTab = ref.read(tabIndexViewModelProvider.notifier).changeTab;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ScreenButton(
          color: currentIndex == 0 ? _activeColor : Colors.black,
          icon: LucideIcons.map,
          text: 'Countries',
          onPressed: () => changeTab(0),
        ),
        ScreenButton(
          color: currentIndex == 1 ? _activeColor : Colors.black,
          icon: PhosphorIcons.broadcast(),
          text: 'Disconnect',
          onPressed: () => changeTab(1),
        ),
        ScreenButton(
          color: currentIndex == 2 ? _activeColor : Colors.black,
          icon: PhosphorIcons.gearSix(),
          text: 'Settings',
          onPressed: () => changeTab(2),
        ),
      ],
    );
  }
}
