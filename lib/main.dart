import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vpnapp/Screens/settings.dart';
import 'package:vpnapp/firebase_options.dart';
import 'package:vpnapp/Screens/TabsScreen.dart';
import 'package:vpnapp/Screens/homepage.dart';
import 'package:vpnapp/login-pages/welcome_screen.dart';

final theme = ThemeData(
  textTheme: TextTheme(
    headlineLarge: TextStyle(fontFamily: 'gilroybold'),
    bodyMedium: TextStyle(
      fontFamily: 'gilroy',
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    labelMedium: TextStyle(
      fontFamily: 'gilroy',
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
      fontFamily: 'gilroy',
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    headlineMedium: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
      fontFamily: 'gilroy',
      color: Colors.black,
    ),
    headlineSmall: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 10,
      fontFamily: 'gilroy',
      color: Color(0x6600091F),
    ),
    bodySmall: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 12,
      fontFamily: 'gilroy',
      color: Color.fromARGB(255, 0, 0, 0),
    ),
  ),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MaterialApp(
      theme: theme,
      // home: StreamBuilder(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (context, Snapshot) {
      //     if (Snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(child: CircularProgressIndicator());
      //     }
      //     if (Snapshot.data != null) {
      //       return const HomePage();
      //     }
      // return
      home: const SettingsScreen(),
    ),
  );
}
