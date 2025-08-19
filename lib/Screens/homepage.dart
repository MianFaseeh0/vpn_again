import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vpnapp/Widgets/catlab.dart';
import 'package:vpnapp/Widgets/countries_overlay1.dart';
import 'package:vpnapp/data/data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({
    required this.dialog1,
    required this.dialog2,
    required this.goCountries,
    super.key,
  });

  final VoidCallback dialog1;
  final VoidCallback dialog2;
  final void Function() goCountries;

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    // Pre-filter the lists first
    final freeList = freecountries.where((c) => c.id == 'free').toList();
    final premList = freecountries.where((c) => c.id == 'pre').toList();

    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 56),
      itemCount: 2 + freeList.length + premList.length, // Headers + both lists
      itemBuilder: (context, index) {
        // Free Countries Header
        if (index == 0) {
          return Catlab(text: 'Free Countries', showdialog: widget.dialog1);
        }

        // Free Countries List
        if (index <= freeList.length) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: CountryOverlay1(
              gotocountriesScreen: widget.goCountries,
              key: ValueKey('free_${freeList[index - 1].id}'),
              country: freeList[index - 1],
            ),
          );
        }

        // Premium Countries Header
        if (index == freeList.length + 1) {
          return Catlab(text: 'Premium Countries', showdialog: widget.dialog2);
        }

        // Premium Countries List
        final premIndex = index - freeList.length - 2;
        return Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: CountryOverlay1(
            gotocountriesScreen: widget.goCountries,
            key: ValueKey('prem_${premList[premIndex].id}'),
            country: premList[premIndex],
          ),
        );
      },
    );
  }
}
