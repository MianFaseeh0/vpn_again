import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vpnapp/Screens/homepage.dart';
import 'package:vpnapp/login-pages/buttons/blue_button.dart';
import 'package:vpnapp/login-pages/text-fields/credentials.dart';

class LoginMain extends StatefulWidget {
  const LoginMain({super.key});

  @override
  State<LoginMain> createState() => _LoginMainState();
}

class _LoginMainState extends State<LoginMain> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  Future<void> gotoHome(context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      Navigator.push(context, MaterialPageRoute(builder: (ctx) => HomePage()));
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/login-screen/VPN app (5) 1.png'),
              Text(
                'Hello Again!',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                "Welcome Back You've \n       Been Missed",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 48),
              Credentials(
                controller: _emailController,
                hintext: 'Email',
                obsecuretext: false,
              ),
              const SizedBox(height: 20),

              Credentials(
                controller: _passwordController,
                hintext: 'Password',
                obsecuretext: true,
              ),
              const SizedBox(height: 10),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Forget Your Password?',
                  style: TextStyle(
                    fontFamily: 'gilroy',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              BlueButton(
                path: null,
                textcolor: Colors.white,
                text: 'Sign In',
                gotofunction: () async {
                  await gotoHome(context);
                },
                color: const Color(0xFF185BFF),
              ),
              SvgPicture.asset('assets/images/login-screen/forget pass.svg'),
              BlueButton(
                path: 'assets/images/login-screen/google.svg',
                textcolor: Colors.black,
                text: 'Sign In With Google',
                gotofunction: () {},
                color: const Color(0x0F00091F),
              ),
              const SizedBox(height: 55),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dont Have An Account?',
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Sign Up',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: const Color(0xFF185BFF),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
