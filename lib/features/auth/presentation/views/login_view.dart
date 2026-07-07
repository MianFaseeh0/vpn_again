import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vpnapp/features/auth/presentation/providers/auth_providers.dart';
import 'package:vpnapp/features/auth/presentation/state/auth_form_state.dart';
import 'package:vpnapp/features/auth/presentation/views/signup_view.dart';
import 'package:vpnapp/features/auth/presentation/widgets/blue_button.dart';
import 'package:vpnapp/features/auth/presentation/widgets/credentials_text_field.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _goToSignup() {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => const SignupView()));
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ref
          .read(loginViewModelProvider.notifier)
          .signIn(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthFormState>(loginViewModelProvider, (previous, next) {
      if (next is AuthFormSuccess) {
        Navigator.of(context).popUntil((route) => route.isFirst);
      } else if (next is AuthFormFailure) {
        ScaffoldMessenger.of(context)
          ..clearSnackBars()
          ..showSnackBar(SnackBar(content: Text(next.message)));
      }
    });

    final formState = ref.watch(loginViewModelProvider);
    final isSubmitting = formState is AuthFormSubmitting;

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
                    CredentialsTextFieldFrame(
                      child: TextFormField(
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
                    CredentialsTextFieldFrame(
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
                      textColor: Colors.white,
                      text: 'Sign In',
                      onPressed: isSubmitting ? () {} : _submit,
                      backgroundColor: const Color(0xFF185BFF),
                    ),
                    SvgPicture.asset(
                      'assets/images/login-screen/forget pass.svg',
                    ),
                    BlueButton(
                      iconAssetPath: 'assets/images/login-screen/google.svg',
                      textColor: Colors.black,
                      text: 'Sign In With Google',
                      onPressed: () {},
                      backgroundColor: const Color(0x0F00091F),
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
                          onPressed: _goToSignup,
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
          if (isSubmitting)
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
