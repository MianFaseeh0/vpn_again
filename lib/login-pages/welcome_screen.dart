import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vpnapp/login-pages/buttons/blue_button.dart';
import 'package:vpnapp/login-pages/login_main.dart';
import 'package:vpnapp/login-pages/signup.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void gotologin(context) {
    Navigator.push(context, MaterialPageRoute(builder: (ctx) => LoginMain()));
  }

  void gotosignUp(context) {
    Navigator.push(context, MaterialPageRoute(builder: (ctx) => Signup()));
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 21,
          children: [
            Spacer(),
            Image.asset('assets/images/login-screen/VPN app (5) 1 (3).png'),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 14),
              child: Column(
                spacing: 16,
                children: [
                  Text(
                    'Secure Browsing\n With No Limits',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    'With Our Encrypted VPN Tunnel, Your\n Data Stay Safe, Even Over Public Or\n     Untrusted Internet Connection.',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
            SvgPicture.asset('assets/images/login-screen/dot.svg'),

            Column(
              children: [
                BlueButton(
                  path: null,
                  textcolor: Colors.white,
                  color: const Color(0xFF185BFF),

                  text: 'Create An Account',
                  gotofunction: () {
                    gotosignUp(context);
                  },
                ),
                const SizedBox(height: 12),
                TextButton(
                  style: TextButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                  ),
                  onPressed: () {
                    gotologin(context);
                  },
                  child: Text(
                    'Sig In',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
