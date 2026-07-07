import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vpnapp/core/utils/duration_formatter.dart';
import 'package:vpnapp/features/countries/domain/entities/country.dart';

class ConnectionSummaryCard extends StatelessWidget {
  const ConnectionSummaryCard({
    required this.country,
    required this.elapsedSeconds,
    required this.downloadLabel,
    required this.uploadLabel,
    required this.footerText,
    required this.footerButton,
    super.key,
  });

  final Country country;
  final int elapsedSeconds;
  final String downloadLabel;
  final String uploadLabel;
  final String footerText;
  final Widget footerButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text(
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
          formatElapsedSeconds(elapsedSeconds),
          style: const TextStyle(
            fontFamily: 'gilroy',
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          margin: const EdgeInsets.only(bottom: 10, left: 65, right: 65),
          width: 248,
          height: 56,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              const SizedBox(width: 12),
              SvgPicture.asset(
                country.flagAssetPath,
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
                    country.name,
                    style: Theme.of(context).textTheme.headlineMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    country.location,
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
                  const Text(
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
            _TrafficTile(
              iconAssetPath: 'assets/DISCONNECT/downloadSpeedIcon.svg',
              label: 'Download',
              value: downloadLabel,
            ),
            _TrafficTile(
              iconAssetPath: 'assets/DISCONNECT/UploadIcon.svg',
              iconSize: 28,
              label: 'Upload',
              value: uploadLabel,
            ),
          ],
        ),
        const Spacer(),
        footerButton,
        const SizedBox(height: 10),
        Text(
          footerText,
          style: const TextStyle(
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

class _TrafficTile extends StatelessWidget {
  const _TrafficTile({
    required this.iconAssetPath,
    required this.label,
    required this.value,
    this.iconSize,
  });

  final String iconAssetPath;
  final double? iconSize;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          SvgPicture.asset(iconAssetPath, width: iconSize, height: iconSize),
          const SizedBox(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall!.copyWith(color: Colors.black),
              ),
              Text(
                value,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
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
    );
  }
}
