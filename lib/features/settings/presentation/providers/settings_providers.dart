import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vpnapp/features/settings/data/repositories/in_memory_settings_repository.dart';
import 'package:vpnapp/features/settings/domain/entities/vpn_settings.dart';
import 'package:vpnapp/features/settings/domain/repositories/settings_repository.dart';
import 'package:vpnapp/features/settings/presentation/viewmodels/settings_viewmodel.dart';

final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  return InMemorySettingsRepository();
});

final settingsViewModelProvider =
    StateNotifierProvider<SettingsViewModel, VpnSettings>((ref) {
      return SettingsViewModel(ref.watch(settingsRepositoryProvider));
    });
