import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/auth/data/models/verify_otp_params.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sing_in_screen.dart';
import 'package:crafty_bay/features/auth/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../../common/presentation/widget/center_circular_progress.dart';
import '../../../common/presentation/widget/snack_ber_message.dart';
import '../../providers/VerifyOtpInProgress.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key, required this.email});

  final String email;

  static const String name = '/otp-verification';

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final VerifyOtpProvider _verifyOtpProvider = VerifyOtpProvider();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ChangeNotifierProvider(
      create: (_) => _verifyOtpProvider,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    const AppLogo(width: 100),
                    const SizedBox(height: 24),
                    Text(
                      'Enter OTP Code',
                      style: textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'A 4 digit verification code has been sent',
                      textAlign: TextAlign.center,
                      style: textTheme.bodyLarge?.copyWith(color: Colors.grey),
                    ),
                    const SizedBox(height: 24),

                    // OTP Input Field
                    PinCodeTextField(
                      length: 4,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(8),
                        fieldHeight: 50,
                        fieldWidth: 50,
                        activeFillColor: Colors.white,
                        inactiveFillColor: Colors.white,
                        selectedFillColor: Colors.white,
                        activeColor: AppColors.themeColor,
                        inactiveColor: AppColors.themeColor.withOpacity(0.5),
                        selectedColor: AppColors.themeColor,
                      ),
                      animationDuration: const Duration(milliseconds: 300),
                      backgroundColor: Colors.transparent,
                      enableActiveFill: true,
                      controller: _otpController,
                      appContext: context,
                      onCompleted: (v) {
                        _onTapVerifyButton();
                      },
                      onChanged: (value) {},
                    ),
                    const SizedBox(height: 24),

                    // Next Button
                    Consumer<VerifyOtpProvider>(
                      builder: (context, verifyOtpProvider, child) {
                        if (_verifyOtpProvider.isVerifyOtpInProgress) {
                          return CenterCirculerProgress();
                        }
                        return FilledButton(
                          onPressed: () {},
                          child: Text('Next'),
                        );
                      },
                    ),
                    const SizedBox(height: 32),

                    // Resend Timer Logic (UI)
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(color: Colors.grey),
                        children: [
                          const TextSpan(text: 'This code will expire in '),
                          TextSpan(
                            text: '120s',
                            style: TextStyle(
                              color: AppColors.themeColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Resend OTP Logic
                      },
                      child: const Text(
                        'Resend Code',
                        style: TextStyle(color: Colors.grey),
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



  void _onTapVerifyButton() {
    if (_formKey.currentState!.validate()) {
      _verifyOtp();
    }
  }

  Future<void> _verifyOtp() async {
    VerifyOtpParams params = VerifyOtpParams(
      email: widget.email,
      otp: _otpController.text,
    );
    final bool isSuccess = await _verifyOtpProvider.verifyOtp(params);
    if(isSuccess){
      Navigator.pushNamedAndRemoveUntil(context, SignInScreen.name ,(protected)=>false);
    }else{
      showSnackBarMessage(context, _verifyOtpProvider.errorMessage ?? 'Something went wrong');
    }
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }
}
