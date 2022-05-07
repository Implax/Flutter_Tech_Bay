import 'package:flutter/widgets.dart';
import 'package:tech_bay/screens/login_success/login_success_screen.dart';
import 'package:tech_bay/screens/splash/splash_screen.dart';
import 'package:tech_bay/screens/sign_in/sign_in_screen.dart';
import 'package:tech_bay/screens/sign_up/sign_up_screen.dart';
import 'screens/details/details_screen.dart';
import 'package:tech_bay/screens/profile/profile_screen.dart';
import 'package:tech_bay/screens/home/home_screen.dart';
import 'screens/cart/cart_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),

  // HomeScreen.routeName: (context) => HomeScreen(),
};
