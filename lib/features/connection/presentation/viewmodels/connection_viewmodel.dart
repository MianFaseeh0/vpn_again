import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vpnapp/features/connection/domain/state/vpn_connection_state.dart';
import 'package:vpnapp/features/countries/domain/entities/country.dart';

class ConnectionViewModel extends StateNotifier<VpnConnectionState> {
  ConnectionViewModel({Duration connectingDelay = const Duration(seconds: 5)})
    : _connectingDelay = connectingDelay,
      super(const VpnDisconnected());

  final Duration _connectingDelay;
  Timer? _connectingTimer;
  Timer? _stopwatchTimer;

  void connect(Country country) {
    _cancelTimers();
    state = VpnConnecting(country);
    _connectingTimer = Timer(_connectingDelay, () {
      state = VpnConnected(country, 0);
      _startStopwatch(country);
    });
  }

  void disconnect() {
    final current = state;
    _cancelTimers();
    switch (current) {
      case VpnConnecting(:final country):
        state = VpnJustDisconnected(country);
      case VpnConnected(:final country):
        state = VpnJustDisconnected(country);
      case VpnDisconnected():
      case VpnJustDisconnected():
        break;
    }
  }

  void _startStopwatch(Country country) {
    _stopwatchTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      final current = state;
      if (current is VpnConnected) {
        state = VpnConnected(country, current.elapsedSeconds + 1);
      }
    });
  }

  void _cancelTimers() {
    _connectingTimer?.cancel();
    _stopwatchTimer?.cancel();
    _connectingTimer = null;
    _stopwatchTimer = null;
  }

  @override
  void dispose() {
    _cancelTimers();
    super.dispose();
  }
}
