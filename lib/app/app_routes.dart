
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../features/auth/presentation/screens/otp_verification_screen.dart';
import '../features/auth/presentation/screens/sing_in_screen.dart';
import '../features/auth/presentation/screens/sing_up_screen.dart';
import '../features/auth/presentation/screens/splash_screen.dart';
import '../features/common/presentation/screens/main_nav_holder_screen.dart';
import '../features/product/presentation/screens/product_details_screen.dart';
import '../features/product/presentation/screens/product_list_by_category_screen.dart';


class AppRoutes {
  static Route<dynamic> route(RouteSettings setting){
    late Widget widget ;

    if(setting.name == SplashScreen.name){
      widget = SplashScreen();
    }else if(setting.name == SignUpScreen.name){
      widget = SignUpScreen();
    }else if(setting.name == SignInScreen.name){
      widget = SignInScreen();
    }else if(setting.name == OtpVerificationScreen.name){
      final email = setting.arguments as String;
      widget = OtpVerificationScreen(email: email,);
    }else if(setting.name == MainNavHolderScreen.name){
      widget = MainNavHolderScreen();
    }else if(setting.name == ProductListByCategoryScreen.name){
      widget = ProductListByCategoryScreen();
    }else if(setting.name == ProductDetailsScreen.name){
      widget = ProductDetailsScreen();
    }
    return MaterialPageRoute(builder: (ctx)=> widget);
  }
}