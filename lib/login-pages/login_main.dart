import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vpnapp/Screens/TabsScreen.dart';
import 'package:vpnapp/login-pages/buttons/blue_button.dart';
import 'package:vpnapp/login-pages/credentials_form_field_style.dart';
import 'package:vpnapp/login-pages/signup.dart';

class LoginMain extends StatefulWidget {
  const LoginMain({super.key});

  @override
  State<LoginMain> createState() => _LoginMainState();
}

class _LoginMainState extends State<LoginMain> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();
  bool _isLoading = false;

  void _gotoSignUp() {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (ctx) => Signup()));
  }

  Future<void> gotoHome(BuildContext context) async {
    try {
      if (_formKey.currentState!.validate()) {
        setState(() {
          _isLoading = true;
        });
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        if (!mounted) {
          return;
        }

        setState(() {
          _isLoading = false;
        });

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (ctx) => TabsScreen()),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (!mounted) {
        return;
      }
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message ?? 'An error occurred')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
              child: Form(
                key: _formKey,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
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
                    CredentialsFormFieldStyle(
                      fieldsType: TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintText: 'Email',
                          hintStyle: Theme.of(context).textTheme.labelSmall,
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !EmailValidator.validate(value)) {
                            return 'Enter a valid Email';
                          }

                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 5),

                    CredentialsFormFieldStyle(
                      fieldsType: TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintText: 'Password',
                          hintStyle: Theme.of(context).textTheme.labelSmall,
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.trim().length <= 6) {
                            return 'Enter a password greater than 6 characters';
                          }
                          return null;
                        },
                      ),
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
                    SvgPicture.asset(
                      'assets/images/login-screen/forget pass.svg',
                    ),
                    BlueButton(
                      path: 'assets/images/login-screen/google.svg',
                      textcolor: Colors.black,
                      text: 'Sign In With Google',
                      gotofunction: () {},
                      color: const Color(0x0F00091F),
                    ),
                    const SizedBox(height: 70),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Dont Have An Account?',
                          style: Theme.of(context).textTheme.labelSmall!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        TextButton(
                          onPressed: _gotoSignUp,
                          child: Text(
                            'Sign Up',
                            style: Theme.of(
                              context,
                            ).textTheme.labelSmall!.copyWith(
                              color: const Color(0xFF185BFF),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
          if (_isLoading)
            Container(
              color: const Color.fromARGB(126, 0, 0, 0),
              child: const Center(
                child: CircularProgressIndicator(color: Color(0xFF185BFF)),
              ),
            ),
        ],
      ),
    );
  }
}
