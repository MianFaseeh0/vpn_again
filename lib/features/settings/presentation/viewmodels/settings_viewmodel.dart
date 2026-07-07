import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vpnapp/features/settings/domain/entities/vpn_settings.dart';
import 'package:vpnapp/features/settings/domain/repositories/settings_repository.dart';

class SettingsViewModel extends StateNotifier<VpnSettings> {
  SettingsViewModel(this._repository) : super(_repository.load());

  final SettingsRepository _repository;

  void setAcceleratorEnabled(bool value) =>
      _update(state.copyWith(acceleratorEnabled: value));

  void setAcceleratorNotificationsEnabled(bool value) =>
      _update(state.copyWith(acceleratorNotificationsEnabled: value));

  void setSplitTunnelingEnabled(bool value) =>
      _update(state.copyWith(splitTunnelingEnabled: value));

  void setNetShieldEnabled(bool value) =>
      _update(state.copyWith(netShieldEnabled: value));

  void setKillSwitchEnabled(bool value) =>
      _update(state.copyWith(killSwitchEnabled: value));

  void _update(VpnSettings next) {
    state = next;
    unawaited(_repository.save(next));
  }
}
