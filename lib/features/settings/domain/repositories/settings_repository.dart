import 'package:vpnapp/features/settings/domain/entities/vpn_settings.dart';

abstract class SettingsRepository {
  VpnSettings load();

  Future<void> save(VpnSettings settings);
}
