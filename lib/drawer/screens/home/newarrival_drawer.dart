import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/drawer/constants.dart';

import 'components/categories.dart';
import 'components/new_arrival_products.dart';
import 'components/popular_products.dart';

class NewARRIVALDrawer extends StatelessWidget {
  const NewARRIVALDrawer({Key? key}) : super(key: key);

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
          IconButton(onPressed: () {}, icon: (Icon(Icons.notification_add))),
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
              title: const Text('T SHIRT COLLECTION'),
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
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NewArrivalProducts(),
            const PopularProducts(),
            Padding(
              padding: const EdgeInsets.only(bottom: 00),
            ),
          ],
        ),
      ),
    );
  }
}
