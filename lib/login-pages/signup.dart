import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vpnapp/login-pages/buttons/blue_button.dart';
import 'package:vpnapp/login-pages/login_main.dart';
import 'package:email_validator/email_validator.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _FormKey = GlobalKey<FormState>();
  bool _isLoading = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _gotologin(context) async {
    if (_FormKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      final userCredentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
          );

      print(userCredentials);

      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Successfully Signed Up')));

      Navigator.push(context, MaterialPageRoute(builder: (ctx) => LoginMain()));
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Form(
        key: _FormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign Up!',
              style: Theme.of(
                context,
              ).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),

            Container(
              width: 296,
              height: 56,
              decoration: BoxDecoration(
                border: BoxBorder.all(color: Color(0x3300091F), width: 1),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    hintText: 'Sign Up',
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
            ),
            const SizedBox(height: 13),

            Container(
              width: 296,
              height: 56,
              decoration: BoxDecoration(
                border: BoxBorder.all(color: Color(0x3300091F), width: 1),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextFormField(
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
            ),
            const SizedBox(height: 30),

            BlueButton(
              path: null,
              textcolor: Colors.white,
              text: 'Sign Up',
              gotofunction: () async {
                await _gotologin(context);
              },
              color: const Color(0xFF185BFF),
            ),
          ],
        ),
      ),
    );

    if (_isLoading) {
      content = Center(child: CircularProgressIndicator());
    }
    return Scaffold(body: content);
  }
}
