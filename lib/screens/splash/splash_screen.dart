import 'package:flutter/material.dart';
import 'package:tech_bay/size_config.dart';
import 'package:tech_bay/screens/splash/components/body.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = '/splash';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
