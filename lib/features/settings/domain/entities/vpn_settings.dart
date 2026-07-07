class VpnSettings {
  const VpnSettings({
    required this.acceleratorEnabled,
    required this.acceleratorNotificationsEnabled,
    required this.splitTunnelingEnabled,
    required this.netShieldEnabled,
    required this.killSwitchEnabled,
  });

  factory VpnSettings.initial() => const VpnSettings(
    acceleratorEnabled: false,
    acceleratorNotificationsEnabled: false,
    splitTunnelingEnabled: false,
    netShieldEnabled: false,
    killSwitchEnabled: false,
  );

  final bool acceleratorEnabled;
  final bool acceleratorNotificationsEnabled;
  final bool splitTunnelingEnabled;
  final bool netShieldEnabled;
  final bool killSwitchEnabled;

  VpnSettings copyWith({
    bool? acceleratorEnabled,
    bool? acceleratorNotificationsEnabled,
    bool? splitTunnelingEnabled,
    bool? netShieldEnabled,
    bool? killSwitchEnabled,
  }) {
    return VpnSettings(
      acceleratorEnabled: acceleratorEnabled ?? this.acceleratorEnabled,
      acceleratorNotificationsEnabled:
          acceleratorNotificationsEnabled ?? this.acceleratorNotificationsEnabled,
      splitTunnelingEnabled: splitTunnelingEnabled ?? this.splitTunnelingEnabled,
      netShieldEnabled: netShieldEnabled ?? this.netShieldEnabled,
      killSwitchEnabled: killSwitchEnabled ?? this.killSwitchEnabled,
    );
  }
}
