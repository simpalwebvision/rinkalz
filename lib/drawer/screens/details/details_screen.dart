import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myapp/constants/themes.dart';
import 'package:myapp/drawer/constants.dart';
import 'package:myapp/drawer/models/Product.dart';

import 'components/color_dot.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.red),
        backgroundColor: Colors.white,
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.only(right: 40),
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
          IconButton(onPressed: () {}, icon: (Icon(Icons.shopping_cart))),
          SizedBox(
            height: 20,
          ),
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
                // Navigator.push(
                // context,
                //  MaterialPageRoute(
                //   builder: (context) => ContactCategory()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.format_quote),
              title: const Text('FAQ'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.info_sharp),
              title: const Text('ABOUT US'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.contact_emergency),
              title: const Text('CONTACT US'),
              onTap: () {},
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              product.image,
              height: MediaQuery.of(context).size.height * 0.4,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: defaultPadding * 1.5),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(defaultPadding,
                    defaultPadding * 2, defaultPadding, defaultPadding),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(defaultBorderRadius * 3),
                    topRight: Radius.circular(defaultBorderRadius * 3),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            product.title,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        const SizedBox(width: defaultPadding),
                        Text(
                          "\₹ " + product.price.toString(),
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: defaultPadding),
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard.",
                      ),
                    ),
                    Text(
                      "Colors",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    const SizedBox(height: defaultPadding / 2),
                    Row(
                      children: const [
                        ColorDot(
                          color: Color(0xFFBEE8EA),
                          isActive: false,
                        ),
                        ColorDot(
                          color: Color(0xFF141B4A),
                          isActive: true,
                        ),
                        ColorDot(
                          color: Color(0xFFF4E5C3),
                          isActive: false,
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          minimumSize: const Size(double.infinity, 50)),
                      onPressed: () {},
                      child: const Text('Add to Cart'),
                    ),
                    SizedBox(
                      height: 7,
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
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
