import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:vpnapp/Screens/settings.dart';
import 'package:vpnapp/appbar/appbarsetting.dart';
import 'package:vpnapp/countries/catlab.dart';
import 'package:vpnapp/countries/countries_overlay1.dart';
import 'package:vpnapp/Screens/homepage.dart';
import 'package:vpnapp/countries/screen_button.dart';
import 'package:vpnapp/data/data.dart';
import 'package:vpnapp/navigation_bar_styling.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {

  int _selectedIndex = 0;
  void dialog1() {
    showDialog(
      context: context,
      builder:
          (ctx) => Dialog(
            insetAnimationDuration: Duration(seconds: 1),
            insetAnimationCurve: Curves.fastLinearToSlowEaseIn,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Text(
                'Free Servers For Limited Time \nConnection !',
                style: Theme.of(
                  context,
                ).textTheme.headlineMedium!.copyWith(fontSize: 19),
              ),
            ),
          ),
    );
  }

  void dialog2() {
    showDialog(
      context: context,
      builder:
          (ctx) => Dialog(
            insetAnimationDuration: Duration(seconds: 1),
            insetAnimationCurve: Curves.fastLinearToSlowEaseIn,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Text(
                'Premium Servers For UnLimited  \nTime Connection !',
                style: Theme.of(
                  context,
                ).textTheme.headlineMedium!.copyWith(fontSize: 19),
              ),
            ),
          ),
    );
  }

  bool _Status = false;
  
 void gotoScreen(String name){
  if(name=='disconnect'){
 _selectedIndex=1;

  }
  if (name == 'settings')
  {_selectedIndex=2;}  
 }


  @override
  Widget build(context) {

Widget currentScreen = HomePage();

if(_selectedIndex==1){
  return currentScreen = SettingsScreen();
}


    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 140,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        backgroundColor: const Color(0xFF185BFF),
        flexibleSpace: const AppbarSettings(),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: HomePage()
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: MediaQuery.of(context).size.height - 250,
            child: CustomPaint(
              size: Size(size.width, size.height),
              painter: BNBCustomPainter(),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              spacing: 38,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ScreenButton(
                  status1: _Status,
                  icon: LucideIcons.map,
                  text: 'Countries',
                  onPressed: ,
                ),
                ScreenButton(
                  icon: PhosphorIcons.broadcast(),
                  text: 'Disconnect',
                  onPressed: gotoDisconnect,
                ),
                ScreenButton(
                  icon: PhosphorIcons.gearSix(),
                  text: 'Settings',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
