import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';
import 'package:myapp/controllers/itembag_controller.dart';
import 'package:myapp/login/NotificationSettingsPage.dart';
import 'package:myapp/login/change_password_screen.dart';
import 'package:myapp/login/login.dart';

import 'package:myapp/pages/PaymentMethodsPage%20.dart';
import 'package:myapp/pages/favorites_pages.dart';
import 'package:myapp/pages/order_page.dart';
import 'package:myapp/pages/setting_page.dart';
import 'package:myapp/screen/MyOrdersScreen.dart';
import 'package:myapp/screen/SettingsPage.dart';
import 'package:myapp/views/cart_page.dart';

class ProfilePages extends StatefulWidget {
  const ProfilePages({super.key});

  @override
  State<ProfilePages> createState() => _ProfilePagesState();
}

class _ProfilePagesState extends State<ProfilePages> {
  File? pickedImage;
  void imagePickerOption() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: Colors.white,
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Pic Image From",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.camera);
                    },
                    icon: const Icon(Icons.camera),
                    label: const Text("CAMERA"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.gallery);
                    },
                    icon: const Icon(Icons.image),
                    label: const Text("GALLERY"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                    label: const Text("CANCEL"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 50,
          ),
          Align(
            alignment: Alignment.center,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.indigo, width: 5),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  child: ClipOval(
                      child: pickedImage != null
                          ? Image.file(
                              pickedImage!,
                              width: 170,
                              height: 170,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              'assets/images/whatsapp dp image6-601.jpg',
                              width: 170,
                              height: 170,
                              fit: BoxFit.cover,
                            )),
                ),
                Positioned(
                  bottom: 0,
                  right: 5,
                  child: IconButton(
                    onPressed: imagePickerOption,
                    icon: const Icon(
                      Icons.add_a_photo_outlined,
                      color: Colors.blue,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Card(
            child: ListTile(
              leading: Icon(Icons.people_alt),
              title: Text('Profile'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('My Orders'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OrderPage()));
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.notification_add),
              title: Text('Notification'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationLogin()));
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.password_rounded),
              title: Text('Change password'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChangePasswordScreen()));
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favorites'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FavoritesPages()));
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.privacy_tip),
              title: Text('Privacy Policy'),
              onTap: () {
                //  Navigator.push(context,
                // MaterialPageRoute(builder: (context) => SignInPage()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
