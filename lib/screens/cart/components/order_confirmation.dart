import 'package:flutter/material.dart';
import 'package:tech_bay/screens/home/home_screen.dart';
import 'package:get/get.dart';
import '../../../models/cart_controller.dart';

class OrderConfirmed extends StatefulWidget {
  const OrderConfirmed({Key? key}) : super(key: key);

  @override
  State<OrderConfirmed> createState() => _OrderConfirmedState();
}

class _OrderConfirmedState extends State<OrderConfirmed> {
  final CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(height: 180),
          buildSuccess(context),
        ],
      ),
    );
  }
}

Widget buildSuccess(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      const Text(
        'Success',
        style: TextStyle(
          fontSize: 25,
          color: Color(0xff120E21),
        ),
      ),
      const SizedBox(height: 50),
      Image.asset(
        'assets/images/order.png',
        width: 500,
        fit: BoxFit.fitWidth,
      ),
      const SizedBox(height: 50),
      GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
        child: RichText(
          text: const TextSpan(children: [
            TextSpan(
              text: 'Back to ',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            TextSpan(
                text: 'Home Page.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ))
          ]),
        ),
      ),
    ],
  );
}
