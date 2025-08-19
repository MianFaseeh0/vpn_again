import 'dart:async';

import 'package:riverpod/riverpod.dart';

class StopwatchNotifier extends StateNotifier<int> {
  StopwatchNotifier() : super(0);

  Timer? _timer;
  bool _isRunning = false;
  int? _lastSavedTime;

  bool get isRunning => _isRunning;
  int? get lastSavedTime => _lastSavedTime;

  void toggle() {
    if (_isRunning) {
      _timer?.cancel();
      _lastSavedTime = state;
    } else {
      _timer = Timer.periodic(const Duration(seconds: 1), (_) {
        state++;
      });
    }
    _isRunning = !_isRunning;
  }

  void start() {
    _timer?.cancel();
    _isRunning = true;
    _lastSavedTime = null;
    state = 0;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      state++;
    });
  }

  void reset() {
    _timer?.cancel();
    _isRunning = false;
    state = 0;
    _lastSavedTime = null;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

final stopwatchProvider = StateNotifierProvider<StopwatchNotifier, int>((ref) {
  return StopwatchNotifier();
});
