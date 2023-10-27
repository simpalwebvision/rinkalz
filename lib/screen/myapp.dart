import 'package:flutter/material.dart';
import 'package:myapp/screen/MyOrdersScreen.dart';
import 'package:myapp/screen/Order%20.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Order order = Order(
    orderNumber: '12345',
    items: [
      CartItem(name: 'Product 1', price: 20.99, quantity: 2),
      CartItem(name: 'Product 2', price: 15.99, quantity: 1),
    ],
    total: 75.99,
    shippingAddress: '123 Main St, City, Country',
    paymentMethod: 'Credit Card',
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My eCommerce App',
      home: OrderConfirmationScreen(order: order),
    );
  }
}
