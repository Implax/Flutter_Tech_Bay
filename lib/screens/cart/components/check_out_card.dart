import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_bay/components/default_button.dart';
import 'package:get/get.dart';
import 'package:tech_bay/screens/cart/components/order_confirmation.dart';
import '../../../constants.dart';
import '../../../models/cart_controller.dart';
import '../../../size_config.dart';

class CheckoutCard extends StatelessWidget {
  final CartController controller = Get.find();
  CheckoutCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenWidth(15),
          horizontal: getProportionateScreenWidth(30),
        ),
        // height: 174,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -15),
              blurRadius: 20,
              color: Color(0xFFDADADA).withOpacity(0.15),
            )
          ],
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row(
              //   children: [
              //     Container(
              //       padding: EdgeInsets.all(10),
              //       height: getProportionateScreenWidth(40),
              //       width: getProportionateScreenWidth(40),
              //       decoration: BoxDecoration(
              //         color: Color(0xFFF5F6F9),
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //       child: SvgPicture.asset("assets/icons/receipt.svg"),
              //     ),
              //     Spacer(),
              //     Text("Add voucher code"),
              //     const SizedBox(width: 10),
              //     Icon(
              //       Icons.arrow_forward_ios,
              //       size: 12,
              //       color: kTextColor,
              //     )
              //   ],
              // ),
              SizedBox(height: getProportionateScreenHeight(20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "Total:\n",
                      children: [
                        TextSpan(
                          text: "\??${controller.total}",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(190),
                    child: DefaultButton(
                      text: "Check Out",
                      press: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new OrderConfirmed()));
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
