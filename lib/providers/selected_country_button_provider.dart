import 'dart:async';

import 'package:riverpod/riverpod.dart';

class CountryToggleNotifier extends StateNotifier<Map<String, bool>> {
  CountryToggleNotifier() : super({});

  String? countryName;
  String? countryPic;
  String? cordinates;

  void toogle(String name) {
    final isCurrentlyOn = state[name] ?? false;

    if (isCurrentlyOn) {
      // Turn off the currently active country
      state = {...state, name: false};
    } else {
      // Turn off all, then turn this one on
      final updatedState = {for (var key in state.keys) key: false, name: true};
      state = updatedState;
    }
  }

  void selectCountry(String name, String pic, String cord) {
    countryName = name;
    countryPic = pic;
    cordinates = cord;
  }
}

final toggleButton =
    StateNotifierProvider<CountryToggleNotifier, Map<String, bool>>((ref) {
      return CountryToggleNotifier();
    });

final isAnyCountryConnectedProvider = StateProvider<bool>((ref) {
  return ref.watch(toggleButton).values.any((isOn) => isOn);
});

class moreCountryToggleNotifier extends StateNotifier<Map<String, bool>> {
  moreCountryToggleNotifier() : super({});

  void toogle(String name) {
    state = {...state, name: !(state[name] ?? false)};
  }

  bool isOn(String name) => state[name] ?? false;
}

final togglemoreButton =
    StateNotifierProvider<moreCountryToggleNotifier, Map<String, bool>>((ref) {
      return moreCountryToggleNotifier();
    });

final connectionTimerProvider =
    StateNotifierProvider<ConnectionTimerNotifier, bool>((ref) {
      return ConnectionTimerNotifier();
    });

class ConnectionTimerNotifier extends StateNotifier<bool> {
  ConnectionTimerNotifier() : super(false);

  Timer? _timer;

  void startTimer() {
    _timer?.cancel();
    state = false;
    _timer = Timer(const Duration(seconds: 5), () {
      state = true;
    });
  }

  void reset() {
    _timer?.cancel();
    state = false;
  }
}
