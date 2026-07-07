import 'package:flutter/material.dart';

class SettingSwitchTile extends StatelessWidget {
  const SettingSwitchTile({
    required this.title,
    required this.description,
    required this.value,
    required this.onChanged,
    super.key,
  });

  final String title;
  final String description;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SwitchListTile(
          activeTrackColor: const Color(0xFF3B74FF),
          value: value,
          title: Text(title, style: Theme.of(context).textTheme.bodyLarge),
          onChanged: onChanged,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Text(description, style: Theme.of(context).textTheme.titleSmall),
        ),
      ],
    );
  }
}
