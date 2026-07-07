import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vpnapp/features/auth/presentation/views/login_view.dart';
import 'package:vpnapp/features/auth/presentation/views/signup_view.dart';
import 'package:vpnapp/features/auth/presentation/widgets/blue_button.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  void _goToLogin(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginView()));
  }

  void _goToSignup(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => const SignupView()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 21,
          children: [
            const Spacer(),
            Image.asset('assets/images/login-screen/VPN app (5) 1 (3).png'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
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
                  textColor: Colors.white,
                  backgroundColor: const Color(0xFF185BFF),
                  text: 'Create An Account',
                  onPressed: () => _goToSignup(context),
                ),
                const SizedBox(height: 12),
                TextButton(
                  style: TextButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                  ),
                  onPressed: () => _goToLogin(context),
                  child: Text(
                    'Sign In',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
