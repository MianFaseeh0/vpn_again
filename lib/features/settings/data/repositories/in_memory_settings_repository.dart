import 'package:vpnapp/features/settings/domain/entities/vpn_settings.dart';
import 'package:vpnapp/features/settings/domain/repositories/settings_repository.dart';

class InMemorySettingsRepository implements SettingsRepository {
  VpnSettings _settings = VpnSettings.initial();

  @override
  VpnSettings load() => _settings;

  @override
  Future<void> save(VpnSettings settings) async {
    _settings = settings;
  }
}
