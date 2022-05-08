import 'package:flutter/material.dart';
import 'package:tech_bay/models/Product.dart';
import 'components/body.dart';
import 'package:tech_bay/components/custom_bottom_nav_bar.dart';
import 'package:tech_bay/enums.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
