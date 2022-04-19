import 'package:flutter/material.dart';
import 'package:tech_bay/size_config.dart';
import 'home_header.dart';
import 'discount_banner.dart';
import 'categories.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            DiscountBanner(),
            Categories(),
          ],
        ),
      ),
    );
  }
}
