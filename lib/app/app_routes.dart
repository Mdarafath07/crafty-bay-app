import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../features/screens/splash_screen.dart';

class AppRoutes {
  static Route<dynamic> route(RouteSettings setting){
     Widget widget = SizedBox();

    if(setting.name ==SplashScreen.name){
      widget = SplashScreen();
    }
    return MaterialPageRoute(builder: (ctx)=> widget);
  }
}