import 'package:flutter_riverpod/flutter_riverpod.dart';

final screenChangerProvider = StateNotifierProvider((ref) {
  return ScreenChangerProviderNotifier();
});

class ScreenChangerProviderNotifier extends StateNotifier<int> {
  ScreenChangerProviderNotifier() : super(0);

  void changeScreen(int index) {
    final selectedIndex = index;
    state = selectedIndex;
  }
}
