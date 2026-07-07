import 'package:vpnapp/features/countries/domain/entities/country.dart';

sealed class CountryListState {
  const CountryListState();
}

class CountryListLoading extends CountryListState {
  const CountryListLoading();
}

class CountryListLoaded extends CountryListState {
  const CountryListLoaded({required this.freeCountries, required this.premiumCountries});

  final List<Country> freeCountries;
  final List<Country> premiumCountries;
}

class CountryListError extends CountryListState {
  const CountryListError(this.message);

  final String message;
}
