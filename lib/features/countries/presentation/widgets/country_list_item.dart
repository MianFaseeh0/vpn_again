import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vpnapp/core/widgets/power_button.dart';
import 'package:vpnapp/features/connection/domain/state/vpn_connection_state.dart';
import 'package:vpnapp/features/connection/presentation/providers/connection_providers.dart';
import 'package:vpnapp/features/countries/domain/entities/country.dart';

class CountryListItem extends ConsumerStatefulWidget {
  const CountryListItem({
    required this.country,
    required this.onConnected,
    super.key,
  });

  final Country country;

  final VoidCallback onConnected;

  @override
  ConsumerState<CountryListItem> createState() => _CountryListItemState();
}

class _CountryListItemState extends ConsumerState<CountryListItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final connectionState = ref.watch(connectionViewModelProvider);
    final isThisCountryActive = switch (connectionState) {
      VpnConnecting(:final country) => country.id == widget.country.id,
      VpnConnected(:final country) => country.id == widget.country.id,
      _ => false,
    };

    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 30, right: 30),
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          SvgPicture.asset(
            widget.country.flagAssetPath,
            width: 42,
            height: 32,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.country.name,
                style: Theme.of(
                  context,
                ).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                widget.country.location,
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall!.copyWith(color: Colors.black),
              ),
            ],
          ),
          const Spacer(),
          PowerButton(
            foregroundColor: isThisCountryActive ? Colors.white : Colors.black,
            backgroundColor: isThisCountryActive
                ? const Color(0xFF3B74FF)
                : const Color.fromARGB(36, 0, 9, 31),
            icon: Icons.power_settings_new,
            onPressed: () {
              final notifier = ref.read(connectionViewModelProvider.notifier);
              if (isThisCountryActive) {
                notifier.disconnect();
              } else {
                notifier.connect(widget.country);
                widget.onConnected();
              }
            },
          ),
          PowerButton(
            foregroundColor: _isExpanded ? Colors.white : Colors.black,
            backgroundColor: _isExpanded
                ? const Color(0xFF3B74FF)
                : const Color.fromARGB(36, 0, 9, 31),
            icon: Icons.arrow_forward_ios,
            onPressed: () => setState(() => _isExpanded = !_isExpanded),
          ),
        ],
      ),
    );
  }
}
