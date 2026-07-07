import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vpnapp/features/connection/presentation/views/connection_view.dart';
import 'package:vpnapp/features/countries/presentation/views/home_view.dart';
import 'package:vpnapp/features/navigation/presentation/providers/navigation_providers.dart';
import 'package:vpnapp/features/navigation/presentation/widgets/app_drawer.dart';
import 'package:vpnapp/features/navigation/presentation/widgets/bottom_nav_bar.dart';
import 'package:vpnapp/features/navigation/presentation/widgets/countries_app_bar.dart';
import 'package:vpnapp/features/navigation/presentation/widgets/nav_bar_background_painter.dart';
import 'package:vpnapp/features/navigation/presentation/widgets/simple_app_bar.dart';
import 'package:vpnapp/features/settings/presentation/views/settings_view.dart';

class TabsView extends ConsumerStatefulWidget {
  const TabsView({super.key});

  @override
  ConsumerState<TabsView> createState() => _TabsViewState();
}

class _TabsViewState extends ConsumerState<TabsView> {
  late final PageController _pageController;

  static const _appBars = [CountriesAppBar(), SimpleAppBar(), SimpleAppBar()];
  static const _appBarColors = [
    Color(0xFF185BFF),
    Color.fromARGB(0, 255, 255, 255),
    Color.fromARGB(0, 255, 255, 255),
  ];
  static const _toolbarHeights = <double?>[140, null, null];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: ref.read(tabIndexViewModelProvider),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _changeTab(int index) {
    ref.read(tabIndexViewModelProvider.notifier).changeTab(index);
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = ref.watch(tabIndexViewModelProvider);

    ref.listen<int>(tabIndexViewModelProvider, (previous, next) {
      if (_pageController.hasClients && _pageController.page?.round() != next) {
        _pageController.jumpToPage(next);
      }
    });

    return Scaffold(
      drawer: const Drawer(backgroundColor: Colors.white, child: AppDrawer()),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: _toolbarHeights[selectedIndex],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        backgroundColor: _appBarColors[selectedIndex],
        flexibleSpace: _appBars[selectedIndex],
      ),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: _changeTab,
            children: [
              HomeView(onCountryConnected: () => _changeTab(1)),
              ConnectionView(onChangeServer: () => _changeTab(0)),
              const SettingsView(),
            ],
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SafeArea(child: NavBarBackground()),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomNavBar(),
          ),
        ],
      ),
    );
  }
}
