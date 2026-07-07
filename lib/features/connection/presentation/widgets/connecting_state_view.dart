import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vpnapp/features/connection/presentation/widgets/cancel_disconnect_button.dart';
import 'package:vpnapp/features/countries/domain/entities/country.dart';

class ConnectingStateView extends StatelessWidget {
  const ConnectingStateView({
    required this.country,
    required this.onCancel,
    super.key,
  });

  final Country country;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        const Text(
          'Status',
          style: TextStyle(
            fontFamily: 'gilroy',
            fontSize: 12,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Connecting...',
          style: TextStyle(
            fontFamily: 'gilroy',
            fontSize: 16,
            color: Color(0xFFE63946),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(13)),
          clipBehavior: Clip.hardEdge,
          child: SvgPicture.asset(country.flagAssetPath, height: 32, width: 32),
        ),
        const SizedBox(height: 12),
        Text(
          country.name,
          style: const TextStyle(
            fontFamily: 'gilroy',
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 300),
        CancelDisconnectButton(
          label: 'Cancel Connection',
          onPressed: onCancel,
        ),
      ],
    );
  }
}
