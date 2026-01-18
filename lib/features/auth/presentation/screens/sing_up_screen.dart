import 'package:crafty_bay/features/auth/data/models/sing_up_params.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sing_in_screen.dart';
import 'package:crafty_bay/features/auth/presentation/widgets/app_logo.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../app/app_colors.dart';
import '../../providers/sing_up_provider.dart';
import 'otp_verification_screen.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  static const String name = "/sing-up";

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final SingUpProvider _singUpProvider = SingUpProvider();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _phoneNumberTEController =
      TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _singUpProvider,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    const AppLogo(width: 100),
                    const SizedBox(height: 16),
                    Text(
                      "Sign Up",
                      style: Theme.of(context).textTheme.headlineLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Get started with your details",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: _firstNameTEController,
                      textInputAction: .next,
                      decoration: const InputDecoration(hintText: "First Name"),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return "First Name is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _lastNameTEController,
                      textInputAction: .next,
                      decoration: const InputDecoration(hintText: "Last Name"),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return "Last Name is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _emailTEController,
                      textInputAction: .next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(hintText: "Email"),
                      validator: (String? value) {
                        if (EmailValidator.validate(value ?? "") == false) {
                          return "Enter a valid email";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _passwordTEController,
                      textInputAction: .next,
                      obscureText: true,
                      decoration: const InputDecoration(hintText: "Password"),
                      validator: (String? value) {
                        if ((value?.length ?? 0) < 6) {
                          return "Password must be at least 6 characters";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _phoneNumberTEController,
                      textInputAction: .next,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(hintText: "Phone"),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return "Phone number is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _cityTEController,
                      textInputAction: .done,

                      decoration: const InputDecoration(hintText: "City"),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return "City is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    Consumer<SingUpProvider>(
                      builder: (context, singUpProvider, child) {
                        return Visibility(
                          visible: singUpProvider.isSingUpInProgress == false,
                          replacement: CircularProgressIndicator(),
                          child: FilledButton(
                            onPressed: _onTapSignUpButton,
                            child: Text('Sign Up'),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
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
      _SingUp();
    }
  }

  Future<void> _SingUp() async {
    final bool _isSucess = await _singUpProvider.singUp(
      SingUpParams(
        firstName: _firstNameTEController.text.trim(),
        lastName: _lastNameTEController.text.trim(),
        email: _emailTEController.text.trim(),

        password: _passwordTEController.text,
        phonNeumber: _phoneNumberTEController.text.trim(),
        city: _cityTEController.text.trim(),
      ),
    );
    if (_isSucess) {
      Navigator.pushNamed(context, OtpVerificationScreen.name);

    }  else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_singUpProvider.errorMessage!),
        ),
      );
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
    _phoneNumberTEController.dispose();
    _cityTEController.dispose();
    // TODO: implement dispose
    super.dispose();
  }



}
