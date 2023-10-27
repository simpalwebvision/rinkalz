import 'package:flutter/material.dart';
import 'package:myapp/controllers/itembag_controller.dart';
import 'package:myapp/drawer/about_drawer.dart.dart';
import 'package:myapp/drawer/contact_drawer.dart';
import 'package:myapp/drawer/faq_drawer.dart';
import 'package:myapp/drawer/screens/home/newarrival_drawer.dart';
import 'package:myapp/pages/ProductCard.dart';
import 'package:myapp/pages/favorites_pages.dart';
import 'package:myapp/views/cart_page.dart';

class CategoryGrid extends StatelessWidget {
  final List<Category> categories = [
    Category(
      name: 'TShirt',
      image: 'assets/images/1.jpg', // Replace with your image paths
    ),
    Category(
      name: 'MEN TSHIRT',
      image: 'assets/images/White Tshirt.png',
    ),
    Category(
      name: 'WOMEN TSHIRT',
      image: 'assets/images/manifest.jpg',
    ),
    Category(
      name: 'KIDS TSHIRT',
      image: 'assets/images/3.jpg',
    ),
    Category(
      name: 'TShirt',
      image: 'assets/images/2.jpg',
    ),

    // Add more categories as needed
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Handle category selection, e.g., navigate to products under this category.
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductsByCategoryScreen(
                  category: categories[index],
                ),
              ),
            );
          },
          child: Card(
            child: Column(
              children: <Widget>[
                Image.asset(
                  categories[index].image,
                  height: 100, // Adjust the size as needed
                ),
                Text(categories[index].name),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ProductsByCategoryScreen extends StatelessWidget {
  final Category category;

  ProductsByCategoryScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    // Fetch and display products related to the selected category.
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.red),
        backgroundColor: Colors.white,
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Center(
              child: Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  scale: 3,
                ),
              ),
            ),
          )
        ]),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20, top: 10),
              child: Badge(
                label: Text(itemBag.length.toString()),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CardPage(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.shopping_cart,
                      size: 24,
                    )),
              )),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FavoritesPages()));
              },
              icon: Icon(Icons.favorite))
        ],
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: <Color>[
                  Color.fromARGB(255, 155, 57, 235),
                  Colors.black
                ])),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Material(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          elevation: 10,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.home),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Hello Binod',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Text(
                        '13677184',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                )),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.collections),
              title: const Text('OUR COLLECTION '),
              onTap: () {
                //    Navigator.push(
                //   context,
                //  MaterialPageRoute(
                //   builder: (context) => ContactCategory()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.share_arrival_time),
              title: const Text('NEW ARRIVAL'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewARRIVALDrawer()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.format_quote),
              title: const Text('FAQ'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FaqDrawer()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_sharp),
              title: const Text('ABOUT US'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_emergency),
              title: const Text('CONTACT US'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContactUs()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text(' Logout '),
              onTap: () {
                // AuthController.logOut();
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          ProductCard(
            title: 'Rinkalz Fashion T Shirts',
            price: '\₹449.99',
            image: 'assets/images/1.jpg',
          ),
          ProductCard(
            title: 'Rinkalz Fashion T Shirts',
            price: '\₹89.99',
            image: 'assets/images/2.jpg',
          ),
          ProductCard(
            title: 'Rinkalz Fashion T Shirts',
            price: '\₹449',
            image: 'assets/images/3.jpg',
          ),
          ProductCard(
            title: 'Rinkalz Fashion T Shirts',
            price: '\₹449',
            image: 'assets/images/1.jpg',
          ),
          ProductCard(
            title: 'Rinkalz Fashion T Shirts',
            price: '\₹449',
            image: 'assets/images/2.jpg',
          ),
          ProductCard(
            title: 'Rinkalz Fashion T Shirts',
            price: '\₹449',
            image: 'assets/images/3.jpg',
          ),
          // Add more products here
        ],
      ),
    );
  }
}

class Category {
  final String name;
  final String image;

  Category({required this.name, required this.image});
}
