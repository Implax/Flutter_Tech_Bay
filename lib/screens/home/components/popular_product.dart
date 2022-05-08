import 'package:flutter/material.dart';
import 'package:tech_bay/components/product_card.dart';
import 'package:tech_bay/models/Product.dart';
import 'package:get/get.dart';
import '../../../models/product_controller.dart';
import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  final productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: SectionTitle(title: "Popular Products", press: () {}),
          ),
          SizedBox(height: getProportionateScreenWidth(20)),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(
                  productController.products.length,
                  (index) {
                    if (productController.products[index].isPopular)
                      return ProductCard(index: index);
                    print(productController.products.length);
                    return SizedBox
                        .shrink(); // here by default width and height is 0
                  },
                ),
                SizedBox(width: getProportionateScreenWidth(20)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
