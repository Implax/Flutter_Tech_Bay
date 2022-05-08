import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final int id;
  final String title;
  final String images;
  final double rating, price;
  final bool isPopular;

  Product({
    required this.id,
    required this.images,
    this.rating = 0.0,
    this.isPopular = false,
    required this.title,
    required this.price,
  });

// Our demo Products
  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
      id: snap['id'],
      title: snap['title'],
      price: snap['price'].toDouble(),
      images: snap['image'],
      rating: snap['rating'].toDouble(),
      isPopular: snap['isPopular'],
    );

    return product;
  }
// List<Product> demoProducts = [
//   Product(
//     id: 1,
//     images: [
//       "assets/images/headset.png",
//     ],
//     title: "Gaming Headset for PC",
//     price: 487.50,
//     description: description,
//     rating: 4.8,
//     // isFavourite: true,
//     isPopular: false,
//   ),
//   Product(
//     id: 2,
//     images: [
//       "assets/images/keyboard.png",
//     ],
//     title: "GK-10 USB Keyboard",
//     price: 350.5,
//     description: description,
//     rating: 4.1,
//     isPopular: true,
//   ),
//   Product(
//     id: 3,
//     images: [
//       "assets/images/razer.png",
//     ],
//     title: "Razer Basilisk X",
//     price: 220.99,
//     description: description,
//     rating: 4.1,
//     // isFavourite: true,
//     isPopular: false,
//   ),
//   Product(
//     id: 4,
//     images: [
//       "assets/images/webcam.png",
//     ],
//     title: "Logitech WebCam",
//     price: 20.20,
//     description: description,
//     rating: 4.1,
//     isPopular: false,
//     // isFavourite: true,
//   ),
//   Product(
//     id: 5,
//     images: [
//       "assets/images/case.png",
//     ],
//     title: "EVA Case",
//     price: 147.00,
//     description: description,
//     rating: 3.5,
//     // isFavourite: true,
//     isPopular: false,
//   ),
//   Product(
//     id: 6,
//     images: [
//       "assets/images/controller.png",
//     ],
//     title: "PS5 Wireless Controller",
//     price: 250.00,
//     description: description,
//     rating: 4.8,
//     // isFavourite: true,
//     isPopular: true,
//   ),
//   Product(
//     id: 7,
//     images: [
//       "assets/images/jbl.png",
//     ],
//     title: "JBL Go 3",
//     price: 420.00,
//     description: description,
//     rating: 4.8,
//     // isFavourite: true,
//     isPopular: true,
//   ),
//   Product(
//     id: 8,
//     images: [
//       "assets/images/ps5.png",
//     ],
//     title: "Sony PS5 Console",
//     price: 7490.00,
//     description: description,
//     rating: 5.0,
//     // isFavourite: true,
//     isPopular: true,
//   ),
//   Product(
//     id: 9,
//     images: [
//       "assets/images/hardrive.png",
//     ],
//     title: "External Hard Disk 3.0",
//     price: 65.00,
//     description: description,
//     rating: 3.5,
//     // isFavourite: true,
//     isPopular: false,
//   ),
// ];
}

const String description =
    "Enjoy 5% instant cashback on airtime & data on TechBay Pay. Use code: MOB5";
