import 'package:flutter/material.dart';

class Product {
  final String image, title;
  final int price;
  final Color bgColor;

  Product({
    required this.image,
    required this.title,
    required this.price,
    this.bgColor = const Color(0xFFEFEFF2),
  });
}

List<Product> demo_product = [
  Product(
    image: "assets/images/1.jpg",
    title: "Raiing Design T Shirts",
    price: 165,
    bgColor: const Color(0xFFFEFBF9),
  ),
  Product(
    image: "assets/images/1.jpg",
    title: "Raiing Design T Shirts",
    price: 324,
  ),
  Product(
    image: "assets/images/1.jpg",
    title: "Raiing Design T Shirts",
    price: 324,
    bgColor: const Color(0xFFF8FEFB),
  ),
  Product(
    image: "assets/images/1.jpg",
    title: "Raiing Design T Shirts",
    price: 324,
    bgColor: const Color(0xFFEEEEED),
  ),
  Product(
    image: "assets/images/1.jpg",
    title: "Raiing Design T Shirts",
    price: 324,
    bgColor: const Color(0xFFEEEEED),
  ),
  Product(
    image: "assets/images/2.jpg",
    title: "Raiing Design T Shirts",
    price: 324,
    bgColor: const Color(0xFFEEEEED),
  ),
];
