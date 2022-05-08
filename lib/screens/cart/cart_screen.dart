import 'package:flutter/material.dart';
import 'package:tech_bay/models/Cart.dart';
import 'package:tech_bay/screens/cart/components/body.dart';
import 'package:tech_bay/models/cart_controller.dart';
import '../../models/Product.dart';
import 'components/check_out_card.dart';
import 'package:tech_bay/models/cart_controller.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  final CartController controller = Get.find();
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Obx(
        () => Column(
          children: [
            Text(
              "Your Cart",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "${controller.products.length} items",
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
    );
  }
}
