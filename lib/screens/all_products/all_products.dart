import 'package:flutter/material.dart';
import 'package:tech_bay/models/Product.dart';
import 'package:tech_bay/size_config.dart';
import 'package:tech_bay/screens/home/components/search_field.dart';
import 'package:tech_bay/constants.dart';
import 'package:tech_bay/screens/details/details_screen.dart';
import 'package:tech_bay/components/product_card.dart';
import 'package:get/get.dart';
import '../../models/cart_controller.dart';
import '../../models/product_controller.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({Key? key}) : super(key: key);
  static String routeName = "/all_products";

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  List<Product> _foundProducts = [];
  final cartController = Get.put(CartController());
  final ProductController productController = Get.find();

  @override
  initState() {
    // at the beginning, all users are shown
    _foundProducts = productController.products;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Product> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = productController.products;
    } else {
      results = productController.products
          .where((user) =>
              user.title.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundProducts = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Product product;

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Products'),
      ),
      body: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              width: SizeConfig.screenWidth * 0.6,
              decoration: BoxDecoration(
                color: kSecondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                onChanged: (value) => _runFilter(value),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20),
                        vertical: getProportionateScreenWidth(9)),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    hintText: "Search product",
                    prefixIcon: Icon(Icons.search)),
              ),
            ),
          ]),
          Expanded(
            child: _foundProducts.isNotEmpty
                ? ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: _foundProducts.length,
                    itemBuilder: (context, index) => Card(
                          key: ValueKey(_foundProducts[index].id),
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: GestureDetector(
                            child: ListTile(
                              leading:
                                  Image.network(_foundProducts[index].images),
                              title: Text(_foundProducts[index].title),
                            ),
                            onTap: () => Navigator.pushNamed(
                              context,
                              DetailsScreen.routeName,
                              arguments: ProductDetailsArguments(
                                  product: _foundProducts[index]),
                            ),
                          ),
                        ))
                : Text('Not Found'),
          ),
        ],
      ),
    );
  }
}
