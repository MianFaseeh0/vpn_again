import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vpnapp/features/countries/presentation/providers/country_providers.dart';
import 'package:vpnapp/features/countries/presentation/state/country_list_state.dart';
import 'package:vpnapp/features/countries/presentation/widgets/category_label.dart';
import 'package:vpnapp/features/countries/presentation/widgets/country_list_item.dart';

class HomeView extends ConsumerWidget {
  const HomeView({required this.onCountryConnected, super.key});

  final VoidCallback onCountryConnected;

  void _showInfoDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            message,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              fontFamily: 'gilroy',
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(countryListViewModelProvider);

    return switch (state) {
      CountryListLoading() => const Center(child: CircularProgressIndicator()),
      CountryListError(:final message) => Center(child: Text(message)),
      CountryListLoaded(:final freeCountries, :final premiumCountries) =>
        ListView.builder(
          padding: const EdgeInsets.only(bottom: 56),
          itemCount: 2 + freeCountries.length + premiumCountries.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return CategoryLabel(
                text: 'Free Countries',
                onInfoTap: () => _showInfoDialog(
                  context,
                  'Free Servers For Limited Time Connection!',
                ),
              );
            }

            if (index <= freeCountries.length) {
              final country = freeCountries[index - 1];
              return Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: CountryListItem(
                  key: ValueKey('free_${country.id}'),
                  country: country,
                  onConnected: onCountryConnected,
                ),
              );
            }

            if (index == freeCountries.length + 1) {
              return CategoryLabel(
                text: 'Premium Countries',
                onInfoTap: () => _showInfoDialog(
                  context,
                  'Premium Servers For Unlimited Time Connection!',
                ),
              );
            }

            final country =
                premiumCountries[index - freeCountries.length - 2];
            return Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: CountryListItem(
                key: ValueKey('premium_${country.id}'),
                country: country,
                onConnected: onCountryConnected,
              ),
            );
          },
        ),
    };
  }
}
