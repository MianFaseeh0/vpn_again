import 'package:vpnapp/features/countries/data/datasources/country_local_data_source.dart';
import 'package:vpnapp/features/countries/domain/entities/country.dart';
import 'package:vpnapp/features/countries/domain/repositories/country_repository.dart';

class LocalCountryRepository implements CountryRepository {
  const LocalCountryRepository(this._dataSource);

  final CountryLocalDataSource _dataSource;

  @override
  Future<List<Country>> getCountries() async {
    return _dataSource.loadAll();
  }
}
