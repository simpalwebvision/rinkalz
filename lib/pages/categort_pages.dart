import 'package:flutter/material.dart';
import 'package:myapp/controllers/itembag_controller.dart';
import 'package:myapp/drawer/about_drawer.dart.dart';
import 'package:myapp/drawer/contact_drawer.dart';
import 'package:myapp/drawer/faq_drawer.dart';
import 'package:myapp/drawer/screens/home/newarrival_drawer.dart';
import 'package:myapp/pages/daets.dart';
import 'package:myapp/pages/favorites_pages.dart';
import 'package:myapp/views/cart_page.dart';

class CategoryPages extends StatefulWidget {
  const CategoryPages({super.key});

  @override
  State<CategoryPages> createState() => _CategoryPagesState();
}

class _CategoryPagesState extends State<CategoryPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.red),
          backgroundColor: Colors.white,
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Center(
              child: Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  scale: 3,
                ),
              ),
            ),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FavoritesPages()));
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
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
        body: CategoryGrid());
  }
}

class Product {
  final String name;
  final String price;
  final String imageUrl;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}
