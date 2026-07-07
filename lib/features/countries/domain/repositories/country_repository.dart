import 'package:vpnapp/features/countries/domain/entities/country.dart';

abstract class CountryRepository {
  Future<List<Country>> getCountries();
}
