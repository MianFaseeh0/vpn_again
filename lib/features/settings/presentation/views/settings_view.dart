import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vpnapp/features/settings/presentation/providers/settings_providers.dart';
import 'package:vpnapp/features/settings/presentation/widgets/setting_switch_tile.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsViewModelProvider);
    final viewModel = ref.read(settingsViewModelProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text('Quick Connect', style: Theme.of(context).textTheme.bodyLarge),
            subtitle: Text(
              'Fastest\nQuick connect button connects you to selected server.',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          SettingSwitchTile(
            title: 'VPN Accelerator',
            description:
                'VPN accelerator enables unique performance-enhancing technologies that can increase speed up to 400%.',
            value: settings.acceleratorEnabled,
            onChanged: viewModel.setAcceleratorEnabled,
          ),
          SettingSwitchTile(
            title: 'VPN Accelerator Notifications',
            description:
                'Get notified when VPN Accelerator switches you to a faster server.',
            value: settings.acceleratorNotificationsEnabled,
            onChanged: viewModel.setAcceleratorNotificationsEnabled,
          ),
          SettingSwitchTile(
            title: 'Split Tunneling',
            description:
                'Allows certain apps or IPs to be excluded from the VPN traffic.',
            value: settings.splitTunnelingEnabled,
            onChanged: viewModel.setSplitTunnelingEnabled,
          ),
          SettingSwitchTile(
            title: 'NetShield',
            description: 'Blocks advertisements, trackers, and malware.',
            value: settings.netShieldEnabled,
            onChanged: viewModel.setNetShieldEnabled,
          ),
          SettingSwitchTile(
            title: 'Kill Switch',
            description:
                'Set up how VPN behaves if your connection is disrupted.',
            value: settings.killSwitchEnabled,
            onChanged: viewModel.setKillSwitchEnabled,
          ),
        ],
      ),
    );
  }
}
