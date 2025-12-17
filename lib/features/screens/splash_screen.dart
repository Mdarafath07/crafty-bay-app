import 'package:crafty_bay/app/extensions/localization_extension.dart';
import 'package:crafty_bay/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../common/presentation/widget/language_selector.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text(
              context.localizations.hello,
            ),
            SizedBox(
              height: 10,
            ),
            LanguageSelector(),
        ]),
    ));
  }
}
