import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vpnapp/features/connection/domain/state/vpn_connection_state.dart';
import 'package:vpnapp/features/connection/presentation/viewmodels/connection_viewmodel.dart';

final connectionViewModelProvider =
    StateNotifierProvider<ConnectionViewModel, VpnConnectionState>((ref) {
      return ConnectionViewModel();
    });
