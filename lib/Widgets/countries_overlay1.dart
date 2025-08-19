import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vpnapp/Widgets/power_button.dart';
import 'package:vpnapp/model/calssapproach.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vpnapp/providers/selected_country_button_provider.dart';
import 'package:vpnapp/providers/stopwatch_provider.dart';

class CountryOverlay1 extends ConsumerStatefulWidget {
  const CountryOverlay1({
    required this.country,
    required this.gotocountriesScreen,
    super.key,
  });
  final void Function() gotocountriesScreen;
  final Calssapproach country;

  @override
  ConsumerState<CountryOverlay1> createState() => _CountryOverlay1State();
}

class _CountryOverlay1State extends ConsumerState<CountryOverlay1>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    print('build1');

    final show = ref.watch(
      togglemoreButton.select(
        (state) => state[widget.country.couname] ?? false,
      ),
    );
    return Container(
      margin: EdgeInsets.only(bottom: 10, left: 30, right: 30),
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
            widget.country.copic,
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
                widget.country.couname,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.country.coloc,
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall!.copyWith(color: Colors.black),
              ),
            ],
          ),

          Spacer(),

          // Power and Arrow buttons
          Consumer(
            builder: (context, ref, child) {
              final isOn = ref.watch(
                toggleButton.select(
                  (state) => state[widget.country.couname] ?? false,
                ),
              );

              print('build2');

              return PowerButton(
                foregrColor:
                    isOn ? Color.fromARGB(255, 255, 255, 255) : Colors.black,
                backgrColor:
                    isOn
                        ? Color(0xFF3B74FF)
                        : const Color.fromARGB(36, 0, 9, 31),
                icon: Icons.power_settings_new,
                onPressed: () {
                  final isAlreadyOn =
                      ref.read(toggleButton)[widget.country.couname] ?? false;

                  if (isAlreadyOn) {
                    // Disconnect same country
                    ref
                        .read(toggleButton.notifier)
                        .toogle(widget.country.couname);
                    ref.read(connectionTimerProvider.notifier).reset();
                    ref
                        .read(stopwatchProvider.notifier)
                        .toggle(); // or .reset() if preferred
                  } else {
                    // Disconnect any active country
                    final activeCountryEntry = ref
                        .read(toggleButton)
                        .entries
                        .firstWhere(
                          (entry) => entry.value == true,
                          orElse: () => MapEntry('', false),
                        );
                    if (activeCountryEntry.key != '') {
                      // If there was a country already connected, disconnect it
                      ref
                          .read(toggleButton.notifier)
                          .toogle(activeCountryEntry.key);
                    }

                    // Now connect the new one
                    ref
                        .read(toggleButton.notifier)
                        .toogle(widget.country.couname);
                    ref
                        .read(toggleButton.notifier)
                        .selectCountry(
                          widget.country.couname,
                          widget.country.copic,
                          widget.country.cordinates,
                        );
                    ref.read(connectionTimerProvider.notifier).startTimer();
                    ref
                        .read(stopwatchProvider.notifier)
                        .start(); // Always fresh start
                    widget.gotocountriesScreen();
                  }
                },
              );
            },
          ),
          PowerButton(
            foregrColor:
                show ? Color.fromARGB(255, 255, 255, 255) : Colors.black,
            backgrColor:
                show ? Color(0xFF3B74FF) : const Color.fromARGB(36, 0, 9, 31),
            icon: Icons.arrow_forward_ios,
            onPressed: () {
              ref
                  .read(togglemoreButton.notifier)
                  .toogle(widget.country.couname);
            },
          ),
        ],
      ),
    );
  }
}
