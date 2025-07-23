import 'package:flutter/material.dart';
import 'package:vpnapp/countries/catlab.dart';
import 'package:vpnapp/data/data.dart';
import 'package:vpnapp/appbar/appbarsetting.dart';
import 'package:vpnapp/countries/countries_overlay1.dart';
import 'package:vpnapp/model/calssapproach.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
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

  @override
  Widget build(context) {
    return   Column(
              children: [
                Catlab(text: 'Free Countries', showdialog: dialog1),
                for (final countries in freecountries)
                  countries.id == 'prem'
                      ? Catlab(text: 'Free Countries', showdialog: dialog1)
                      : CountryOverlay1(
                        countryname: countries.couname,
                        locations: countries.coloc,
                        picture: countries.copic,
                      ),
              ],

             
            ),
  }
}
