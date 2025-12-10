import 'package:crafty_bay/app/app_routes.dart';
import 'package:crafty_bay/features/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import 'app_theme.dart';
class CraftyBayApp extends StatefulWidget {
  const CraftyBayApp({super.key});

  @override
  State<CraftyBayApp> createState() => _CraftyBayAppState();
}

class _CraftyBayAppState extends State<CraftyBayApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashScreen.name,
      onGenerateRoute: AppRoutes.route,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: .dark,
    );
  }
}
