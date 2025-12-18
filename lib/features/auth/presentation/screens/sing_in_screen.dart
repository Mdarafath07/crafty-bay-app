import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sing_up_screen.dart';
import 'package:crafty_bay/features/auth/presentation/widgets/app_logo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'otp_verification_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 60),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const AppLogo(width: 100),
                  const SizedBox(height: 24),
                  Text(
                    'Welcome Back',
                    style: textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Please enter your details to sign in',
                    textAlign: TextAlign.center,
                    style: textTheme.bodyMedium?.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(height: 32),

                  // Email Field
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Email Address',
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Password Field
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock_outline),
                      suffixIcon: Icon(Icons.visibility_off_outlined),
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: _onTapForgotPassword,
                      child: const Text('Forgot Password?'),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Sign In Button
                  FilledButton(
                    onPressed: _onTapSignInButton,
                    child: Text('Sign In'),
                  ),
                  const SizedBox(height: 24),


                  RichText(
                    text: TextSpan(
                      style: textTheme.bodyMedium,
                      text: "Don't have an account? ",
                      children: [
                        TextSpan(
                          style: TextStyle(
                            color: AppColors.themeColor,
                            fontWeight: FontWeight.bold,
                          ),
                          text: 'Sign Up',
                          recognizer: TapGestureRecognizer()
                            ..onTap = _onTapSignUpButton,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapForgotPassword() {

  }

  void _onTapSignUpButton() {
    Navigator.pushNamed(context, SingUpScreen.name);

  }

  void _onTapSignInButton() {
    Navigator.pushNamed(context, OtpVerificationScreen.name);

  }
}