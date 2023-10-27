import 'package:flutter/material.dart';
import 'package:myapp/controllers/itembag_controller.dart';
import 'package:myapp/pages/favorites_pages.dart';
import 'package:myapp/views/cart_page.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List<String> cartItems = [];

  void addToCart(String item) {
    setState(() {
      cartItems.add(item);
    });
  }

  double calculateTotal() {
    // Calculate the total cost of items in the cart (you would typically have prices associated with items).
    // For simplicity, let's assume each item costs $10.
    return cartItems.length * 10.0;
  }

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
                scale: 2,
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Available Items:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            // List of available items to add to the cart
            Column(
              children: <Widget>[
                // Replace these ListTile widgets with your actual shopping items.
                ListTile(
                  title: Text('Item 1'),
                  trailing: ElevatedButton(
                    onPressed: () {
                      addToCart('Item 1');
                    },
                    child: Text('Add to Cart'),
                  ),
                ),
                ListTile(
                  title: Text('Item 2'),
                  trailing: ElevatedButton(
                    onPressed: () {
                      addToCart('Item 2');
                    },
                    child: Text('Add to Cart'),
                  ),
                ),
                // Add more items here...
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Your Cart:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            // List of items in the cart
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(cartItems[index]),
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Total: \$${calculateTotal().toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
