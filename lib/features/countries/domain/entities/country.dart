enum CountryTier { free, premium }

class Country {
  const Country({
    required this.id,
    required this.name,
    required this.flagAssetPath,
    required this.location,
    required this.ipAddress,
    required this.tier,
  });

  final String id;
  final String name;
  final String flagAssetPath;
  final String location;
  final String ipAddress;
  final CountryTier tier;
}
