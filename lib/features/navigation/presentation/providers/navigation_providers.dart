import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vpnapp/features/navigation/presentation/viewmodels/tab_index_viewmodel.dart';

final tabIndexViewModelProvider =
    StateNotifierProvider<TabIndexViewModel, int>((ref) {
      return TabIndexViewModel();
    });
