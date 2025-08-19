import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vpnapp/providers/selected_country_button_provider.dart';
import 'package:vpnapp/providers/stopwatch_provider.dart';

class Connectedstate extends ConsumerStatefulWidget {
  const Connectedstate({required this.button, required this.text, super.key});
  final Widget button;
  final String text;
  @override
  ConsumerState<Connectedstate> createState() {
    return _ConnectedstateState();
  }
}

class _ConnectedstateState extends ConsumerState<Connectedstate> {
  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  @override
  Widget build(BuildContext context) {
    final seconds = ref.watch(stopwatchProvider);

    return Column(
      children: [
        SizedBox(height: 20),
        Text(
          'Connection Time',
          style: TextStyle(
            fontFamily: 'gilroy',
            fontSize: 12,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          formatTime(seconds),
          style: TextStyle(
            fontFamily: 'gilroy',
            fontSize: 25,
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          margin: EdgeInsets.only(bottom: 10, left: 65, right: 65),
          width: 248,
          height: 56,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              const SizedBox(width: 12),
              Consumer(
                builder: (context, ref, child) {
                  final pic = ref.read(toggleButton.notifier).countryPic;
                  return SvgPicture.asset(
                    '$pic',
                    width: 42,
                    height: 32,
                    fit: BoxFit.cover,
                  );
                },
              ),
              const SizedBox(width: 12),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Consumer(
                    builder: (context, ref, child) {
                      final name = ref.read(toggleButton.notifier).countryName;
                      return Text(
                        '$name',
                        style: Theme.of(context).textTheme.headlineMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      );
                    },
                  ),
                  Text(
                    'London',
                    style: Theme.of(
                      context,
                    ).textTheme.headlineSmall!.copyWith(color: Colors.black),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Stealth',
                    style: TextStyle(
                      fontFamily: 'gilroy',
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    '14%',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 5),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 5,
          children: [
            Container(
              width: 120,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 12),
                  SvgPicture.asset('assets/DISCONNECT/downloadSpeedIcon.svg'),
                  const SizedBox(width: 12),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Download',
                        style: Theme.of(context).textTheme.headlineSmall!
                            .copyWith(color: Colors.black),
                      ),
                      Text(
                        '300MB',
                        style: Theme.of(
                          context,
                        ).textTheme.headlineSmall!.copyWith(
                          color: Colors.black,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 5),
                ],
              ),
            ),
            Container(
              width: 120,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 12),
                  SvgPicture.asset(
                    'assets/DISCONNECT/UploadIcon.svg',
                    width: 28,
                    height: 28,
                  ),
                  const SizedBox(width: 12),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Upload',
                        style: Theme.of(context).textTheme.headlineSmall!
                            .copyWith(color: Colors.black),
                      ),
                      Text(
                        '34MB',
                        style: Theme.of(
                          context,
                        ).textTheme.headlineSmall!.copyWith(
                          color: Colors.black,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 5),
                ],
              ),
            ),
          ],
        ),
        const Spacer(),
        widget.button,
        const SizedBox(height: 10),

        Text(
          widget.text,
          style: TextStyle(
            fontFamily: 'gilroy',
            fontSize: 16,
            color: Color(0xFFE63946),
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 90),
      ],
    );
  }
}
