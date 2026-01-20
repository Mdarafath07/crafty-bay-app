
import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sing_in_screen.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/presentation/widget/snack_ber_message.dart';
import '../../data/models/sing_up_params.dart';
import '../../providers/sing_up_provider.dart';
import '../widgets/app_logo.dart';
import 'otp_verification_screen.dart';



class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpProvider _signUpProvider = SignUpProvider();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _phoneTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return ChangeNotifierProvider(
      create: (_) => _signUpProvider,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                autovalidateMode: .onUserInteraction,
                child: Column(
                  spacing: 8,
                  children: [
                    AppLogo(width: 90),
                    const SizedBox(height: 8),
                    Text(
                      'Sign Up',
                      style: textTheme.headlineMedium?.copyWith(
                        fontWeight: .bold,
                      ),
                    ),
                    Text(
                      'Get started with your details',
                      style: textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _firstNameTEController,
                      textInputAction: .next,
                      decoration: InputDecoration(hintText: 'First name'),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Enter your first name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _lastNameTEController,
                      textInputAction: .next,
                      decoration: InputDecoration(hintText: 'Last name'),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Enter your last name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _emailTEController,
                      textInputAction: .next,
                      keyboardType: .emailAddress,
                      decoration: InputDecoration(hintText: 'Email'),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Enter your valid email';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _passwordTEController,
                      textInputAction: .next,
                      decoration: InputDecoration(hintText: 'Password'),
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return 'Enter your password';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _phoneTEController,
                      textInputAction: .next,
                      keyboardType: .phone,
                      decoration: InputDecoration(hintText: 'Phone'),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Enter your valid phone';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _cityTEController,
                      decoration: InputDecoration(hintText: 'City'),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Enter your city';
                        }
                        return null;
                      },
                    ),
                    Consumer<SignUpProvider>(
                      builder: (context, signUpProvider, child) {
                        return Visibility(
                          visible: signUpProvider.isSignUpInProgress == false,
                          replacement: const Center(
                            child: CircularProgressIndicator(),
                          ),
                          child: FilledButton(
                            onPressed: _onTapSignUpButton,
                            child: Text('Sign Up'),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                        style: textTheme.bodyMedium,
                        text: 'Already have an account? ',
                        children: [
                          TextSpan(
                            style: TextStyle(
                              color: AppColors.themeColor,
                              fontWeight: .bold,
                            ),
                            text: 'Sign In',
                            recognizer: TapGestureRecognizer()
                              ..onTap = _onTapSignInButton,
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
      ),
    );
  }

  void _onTapSignUpButton() {
    if (_formKey.currentState!.validate()) {
      _signUp();
    }
  }

  Future<void> _signUp() async {
    final bool isSuccess = await _signUpProvider.signUp(
      SignUpParams(
        firstName: _firstNameTEController.text.trim(),
        lastName: _lastNameTEController.text.trim(),
        email: _emailTEController.text.trim(),
        password: _passwordTEController.text,
        phone: _phoneTEController.text.trim(),
        city: _cityTEController.text.trim(),
      ),
    );
    if (isSuccess) {
      Navigator.pushNamed(
        context,
        OtpVerificationScreen.name,
        arguments: _emailTEController.text.trim(),
      );
    } else {
     showSnackBarMessage(context, _signUpProvider.errorMessage ?? 'Something went wrong');
    }
  }

  void _onTapSignInButton() {
    Navigator.pushNamed(context, SignInScreen.name);
  }

  @override
  void dispose() {
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
    _phoneTEController.dispose();
    _cityTEController.dispose();
    super.dispose();
  }
}
