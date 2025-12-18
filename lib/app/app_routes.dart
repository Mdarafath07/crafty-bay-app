
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../features/auth/presentation/screens/sing_in_screen.dart';
import '../features/auth/presentation/screens/sing_up_screen.dart';
import '../features/auth/presentation/screens/splash_screen.dart';


class AppRoutes {
  static Route<dynamic> route(RouteSettings setting){
    late Widget widget ;

    if(setting.name == SplashScreen.name){
      widget = SplashScreen();
    }else if(setting.name == SingUpScreen.name){
      widget = SingUpScreen();
    }else if(setting.name == SignInScreen.name){
      widget = SignInScreen();
    }
    return MaterialPageRoute(builder: (ctx)=> widget);
  }
}