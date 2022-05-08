import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_bay/models/Cart.dart';
import 'package:tech_bay/models/cart_controller.dart';
import 'package:get/get.dart';
import '../../../size_config.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: ListView.builder(
          itemCount: controller.products.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: CartCard(
              controller: controller,
              product: controller.products.keys.toList()[index],
              quantity: controller.products.values.toList()[index],
              index: index,
            ),
          ),
        ),
      ),
    );
  }
}
