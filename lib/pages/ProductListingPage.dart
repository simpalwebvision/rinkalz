import 'package:flutter/material.dart';
import 'package:myapp/pages/categoryId.dart';
import 'package:myapp/pages/shop_pages.dart';

class ProductsPage extends StatelessWidget {
  final Category category;

  ProductsPage({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products in ${category.name}'),
      ),
      body: ListView.builder(
        itemCount: products.length, // Replace with your actual list of products
        itemBuilder: (ctx, index) {
          final product = products[index];

          // Check if the product belongs to the selected category
          if (product.categoryId == category.id) {
            return ListTile(
              leading: Image.network(product.imageUrl),
              title: Text(product.name),
              subtitle: Text(product.description),
              trailing: Text('\$${product.price.toStringAsFixed(2)}'),
            );
          } else {
            return Container(); // Return an empty container for products not in the category
          }
        },
      ),
    );
  }
}
