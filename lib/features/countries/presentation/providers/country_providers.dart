import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vpnapp/features/countries/data/datasources/country_local_data_source.dart';
import 'package:vpnapp/features/countries/data/repositories/local_country_repository.dart';
import 'package:vpnapp/features/countries/domain/repositories/country_repository.dart';
import 'package:vpnapp/features/countries/presentation/state/country_list_state.dart';
import 'package:vpnapp/features/countries/presentation/viewmodels/country_list_viewmodel.dart';

final countryRepositoryProvider = Provider<CountryRepository>((ref) {
  return const LocalCountryRepository(CountryLocalDataSource());
});

final countryListViewModelProvider =
    StateNotifierProvider<CountryListViewModel, CountryListState>((ref) {
      return CountryListViewModel(ref.watch(countryRepositoryProvider));
    });
