import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vpnapp/features/auth/presentation/providers/auth_providers.dart';
import 'package:vpnapp/features/auth/presentation/state/auth_form_state.dart';
import 'package:vpnapp/features/auth/presentation/widgets/blue_button.dart';
import 'package:vpnapp/features/auth/presentation/widgets/credentials_text_field.dart';

class SignupView extends ConsumerStatefulWidget {
  const SignupView({super.key});

  @override
  ConsumerState<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends ConsumerState<SignupView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ref
          .read(signupViewModelProvider.notifier)
          .signUp(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthFormState>(signupViewModelProvider, (previous, next) {
      if (next is AuthFormSuccess) {
        ScaffoldMessenger.of(context)
          ..clearSnackBars()
          ..showSnackBar(const SnackBar(content: Text('Successfully Signed Up')));
        Navigator.of(context).popUntil((route) => route.isFirst);
      } else if (next is AuthFormFailure) {
        ScaffoldMessenger.of(context)
          ..clearSnackBars()
          ..showSnackBar(SnackBar(content: Text(next.message)));
      }
    });

    final formState = ref.watch(signupViewModelProvider);
    final isSubmitting = formState is AuthFormSubmitting;

    Widget content = Center(
      child: Form(
        key: _formKey,
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
            CredentialsTextFieldFrame(
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
            const SizedBox(height: 13),
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
            const SizedBox(height: 30),
            BlueButton(
              textColor: Colors.white,
              text: 'Sign Up',
              onPressed: isSubmitting ? () {} : _submit,
              backgroundColor: const Color(0xFF185BFF),
            ),
          ],
        ),
      ),
    );

    if (isSubmitting) {
      content = const Center(child: CircularProgressIndicator());
    }
    return Scaffold(body: content);
  }
}
