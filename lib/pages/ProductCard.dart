import 'package:flutter/material.dart';
import 'package:myapp/constants/themes.dart';
import 'package:myapp/drawer/constants.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String image;

  ProductCard({
    required this.title,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Image.asset(image),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Price: $price',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          MaterialButton(
            color: Colors.purple,
            onPressed: () {
              // Navigate to the product detail page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(
                    title: title,
                    price: price,
                    image: image,
                  ),
                ),
              );
            },
            child: Text(
              'View Details',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final String title;
  final String price;
  final String image;

  ProductDetailScreen({
    required this.title,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(image),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Price: $price',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ],
          ),

          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              Icon(
                Icons.star,
                color: Colors.amber,
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: defaultPadding),
            child: Text(
              textAlign: TextAlign.justify,
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard.",
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                minimumSize: const Size(double.infinity, 50)),
            onPressed: () {},
            child: const Text('SHOP BY FLIPKART'),
          ),
          SizedBox(
            height: 7,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                minimumSize: const Size(double.infinity, 50)),
            onPressed: () {},
            child: const Text('SHOP BY MEESHO'),
          ),
          SizedBox(
            height: 7,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                minimumSize: const Size(double.infinity, 50)),
            onPressed: () {},
            child: const Text('SHOP BY AMAZON'),
          ),

          // Add more details here
        ],
      ),
    );
  }
}
