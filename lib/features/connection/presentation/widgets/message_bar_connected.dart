import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MessageBarConnected extends StatelessWidget {
  const MessageBarConnected({
    required this.countryName,
    required this.ipAddress,
    super.key,
  });

  final String countryName;
  final String ipAddress;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset('assets/DISCONNECT/message.svg'),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              countryName,
              style: const TextStyle(
                fontFamily: 'gilroy',
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              ipAddress,
              style: const TextStyle(
                fontFamily: 'gilroy',
                fontSize: 9,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}
