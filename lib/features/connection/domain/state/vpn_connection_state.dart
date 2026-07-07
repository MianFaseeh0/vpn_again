import 'package:vpnapp/features/countries/domain/entities/country.dart';

sealed class VpnConnectionState {
  const VpnConnectionState();
}

class VpnDisconnected extends VpnConnectionState {
  const VpnDisconnected();
}

class VpnConnecting extends VpnConnectionState {
  const VpnConnecting(this.country);

  final Country country;
}

class VpnConnected extends VpnConnectionState {
  const VpnConnected(this.country, this.elapsedSeconds);

  final Country country;
  final int elapsedSeconds;
}

class VpnJustDisconnected extends VpnConnectionState {
  const VpnJustDisconnected(this.country);

  final Country country;
}
