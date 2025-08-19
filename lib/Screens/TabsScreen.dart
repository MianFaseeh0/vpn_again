import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:vpnapp/Screens/ConnectionsScreen.dart';
import 'package:vpnapp/Screens/homepage.dart';
import 'package:vpnapp/screens/settings.dart';
import 'package:vpnapp/Widgets/drawer.dart';
import 'package:vpnapp/Widgets/tabscreen_bottom_buttons.dart';
import 'package:vpnapp/appbar/appbarsetting.dart';
import 'package:vpnapp/appbar/else_appbar.dart';
import 'package:vpnapp/navigation_bar_styling.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  late Widget painter = customPainter();
  int _selectedIndex = 0;
  late final PageController _pageController;

  late final List<Widget> _screens;
  late final List<Widget> _appBars;
  late final List<Color> _appBarColors;
  late final List<double?> _toolbarHeights;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: _selectedIndex);

    _screens = [
      HomePage(
        goCountries: () {
          _gotoScreen(1);
        },
        dialog1: _showFreeDialog,
        dialog2: _showPremiumDialog,
      ),
      ConnectionsScreen(
        goscreen: () {
          _gotoScreen(0);
        },
      ),
      const SettingsScreen(),
    ];

    _appBars = [const AppbarSettings(), const ElseAppbar(), const ElseAppbar()];

    _appBarColors = [
      const Color(0xFF185BFF),
      const Color.fromARGB(0, 255, 255, 255),
      const Color.fromARGB(0, 255, 255, 255),
    ];

    _toolbarHeights = [140, null, null];

    painter = customPainter();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final _freeDialog = Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Text(
        'Free Servers For Limited Time Connection!',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          fontFamily: 'gilroy',
          color: Colors.black,
        ),
      ),
    ),
  );

  final _premiumDialog = Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Text(
        'Premium Servers For Unlimited Time Connection!',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          fontFamily: 'gilroy',
          color: Colors.black,
        ),
      ),
    ),
  );

  Future<void> _showFreeDialog() async {
    await showDialog(context: context, builder: (ctx) => _freeDialog);
  }

  Future<void> _showPremiumDialog() async {
    await showDialog(context: context, builder: (ctx) => _premiumDialog);
  }

  void _gotoScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: DrawerWidget(
          gotosetting: () {
            _gotoScreen(2);
            Navigator.of(context).pop();
          },
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: _toolbarHeights[_selectedIndex],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        backgroundColor: _appBarColors[_selectedIndex],
        flexibleSpace: _appBars[_selectedIndex],
      ),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            children: _screens,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SafeArea(child: painter),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: TabscreenBottomButtons(
              currentIndex: _selectedIndex,
              currentScreen0: () => _gotoScreen(0),
              currentScreen1: () => _gotoScreen(1),
              currentScreen2: () => _gotoScreen(2),
            ),
          ),
        ],
      ),
    );
  }
}
