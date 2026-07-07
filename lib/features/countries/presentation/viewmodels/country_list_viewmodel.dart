import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vpnapp/features/countries/domain/entities/country.dart';
import 'package:vpnapp/features/countries/domain/repositories/country_repository.dart';
import 'package:vpnapp/features/countries/presentation/state/country_list_state.dart';

class CountryListViewModel extends StateNotifier<CountryListState> {
  CountryListViewModel(this._repository) : super(const CountryListLoading()) {
    _load();
  }

  final CountryRepository _repository;

  Future<void> _load() async {
    try {
      final countries = await _repository.getCountries();
      state = CountryListLoaded(
        freeCountries:
            countries.where((c) => c.tier == CountryTier.free).toList(),
        premiumCountries:
            countries.where((c) => c.tier == CountryTier.premium).toList(),
      );
    } catch (_) {
      state = const CountryListError('Unable to load countries.');
    }
  }

  Future<void> reload() => _load();
}
