import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabIndexViewModel extends StateNotifier<int> {
  TabIndexViewModel() : super(0);

  void changeTab(int index) => state = index;
}
