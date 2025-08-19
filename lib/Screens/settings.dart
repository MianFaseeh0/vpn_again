import 'package:flutter/material.dart';
import 'package:vpnapp/Widgets/setting_text.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

enum Filter { ks, ns, st, va, van }

class _SettingsScreenState extends State<SettingsScreen> {
  var ksfilterset = false;
  var nsfilterset = false;

  var stfilterset = false;

  var vafilterset = false;

  var vanfilterset = false;

  void initState() {
    super.initState();
  }

  // Filters.ks: false,
  // Filters.ns: false,
  // Filters.st: false,
  // Filters.va: false,
  // Filters.van: false,

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              'Quick Connect',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            subtitle: Text(
              'Fastest\nQuick connect button connects you to selected server.',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),

          // VPN Accelerator
          SwitchListTile(
            activeTrackColor: const Color(0xFF3B74FF),
            value: vafilterset,
            title: Text(
              'VPN Accelerator',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            onChanged:
                (isChecked) => setState(() {
                  vafilterset = isChecked;
                }),
          ),
          const SettingText(
            text:
                'VPN accelerator enables unique performance-enhancing technologies that can increase speed up to 400%.',
          ),

          // VPN Accelerator Notifications
          SwitchListTile(
            activeTrackColor: const Color(0xFF3B74FF),

            value: vanfilterset,
            title: Text(
              'VPN Accelerator Notifications',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            onChanged:
                (isChecked) => setState(() {
                  vanfilterset = isChecked;
                }),
          ),
          const SettingText(
            text:
                'Get notified when VPN Accelerator switches you to a faster server.',
          ),

          // Split Tunneling
          SwitchListTile(
            activeTrackColor: const Color(0xFF3B74FF),

            value: stfilterset,
            title: Text(
              'Split Tunneling',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            onChanged:
                (isChecked) => setState(() {
                  stfilterset = isChecked;
                }),
          ),
          const SettingText(
            text:
                'Allows certain apps or IPs to be excluded from the VPN traffic.',
          ),

          // NetShield
          SwitchListTile(
            activeTrackColor: const Color(0xFF3B74FF),

            value: nsfilterset,
            title: Text(
              'NetShield',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            onChanged:
                (isChecked) => setState(() {
                  nsfilterset = isChecked;
                }),
          ),
          const SettingText(
            text: 'Blocks advertisements, trackers, and malware.',
          ),

          // Kill Switch
          SwitchListTile(
            activeTrackColor: const Color(0xFF3B74FF),
            value: ksfilterset,
            title: Text(
              'Kill Switch',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            onChanged:
                (isChecked) => setState(() {
                  ksfilterset = isChecked;
                }),
          ),
          const SettingText(
            text: 'Set up how VPN behaves if your connection is disrupted.',
          ),
        ],
      ),
    );
  }
}
