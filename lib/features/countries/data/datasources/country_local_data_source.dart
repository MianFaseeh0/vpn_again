import 'package:vpnapp/features/countries/domain/entities/country.dart';

class CountryLocalDataSource {
  const CountryLocalDataSource();

  List<Country> loadAll() => _countries;

  static const List<Country> _countries = [
    Country(
      id: 'italy',
      name: 'Italy',
      flagAssetPath: 'assets/countries/italy.svg',
      location: '4 Locations',
      ipAddress: '192.168.0.1',
      tier: CountryTier.free,
    ),
    Country(
      id: 'netherlands',
      name: 'Netherland',
      flagAssetPath: 'assets/countries/Netherlands.svg',
      location: '6 Locations',
      ipAddress: '192.168.1.1',
      tier: CountryTier.free,
    ),
    Country(
      id: 'germany',
      name: 'Germany',
      flagAssetPath: 'assets/countries/germany.svg',
      location: '6 Locations',
      ipAddress: '192.168.1.254',
      tier: CountryTier.free,
    ),
    Country(
      id: 'brazil',
      name: 'Brazil',
      flagAssetPath: 'assets/countries/brazil.svg',
      location: '4 Locations',
      ipAddress: '192.168.10.1',
      tier: CountryTier.premium,
    ),
    Country(
      id: 'canada',
      name: 'Canada',
      flagAssetPath: 'assets/countries/canada.svg',
      location: '4 Locations',
      ipAddress: '192.168.8.1',
      tier: CountryTier.premium,
    ),
    Country(
      id: 'usa',
      name: 'USA',
      flagAssetPath: 'assets/countries/usa.svg',
      location: '4 Locations',
      ipAddress: '192.168.2.1',
      tier: CountryTier.premium,
    ),
    Country(
      id: 'turkey',
      name: 'Turkey',
      flagAssetPath: 'assets/countries/Turkey.svg',
      location: '4 Locations',
      ipAddress: '192.168.3.1',
      tier: CountryTier.premium,
    ),
    Country(
      id: 'france',
      name: 'France',
      flagAssetPath: 'assets/countries/France.svg',
      location: '4 Locations',
      ipAddress: '192.168.100.1',
      tier: CountryTier.premium,
    ),
    Country(
      id: 'england',
      name: 'England',
      flagAssetPath: 'assets/countries/england.svg',
      location: '4 Locations',
      ipAddress: '10.1.1.1',
      tier: CountryTier.premium,
    ),
  ];
}
