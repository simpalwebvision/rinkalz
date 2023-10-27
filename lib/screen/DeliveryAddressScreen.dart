import 'package:flutter/material.dart';
import 'package:myapp/controllers/itembag_controller.dart';
import 'package:myapp/views/cart_page.dart';

class DeliveryAddressScreen extends StatefulWidget {
  const DeliveryAddressScreen({Key? key}) : super(key: key);

  @override
  _DeliveryAddressScreenState createState() => _DeliveryAddressScreenState();
}

class _DeliveryAddressScreenState extends State<DeliveryAddressScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController _MobileCodeController = TextEditingController();
  final TextEditingController _StateCodeController = TextEditingController();

  String _country = 'Select Country';
  List<String> _countryList = [
    'Select Country',
    'United States',
    'Canada',
    'United Kingdom',
    'Australia',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
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
                ))
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
          child: Column(children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                'Add  Shopping Address ',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Stack(children: [
                SingleChildScrollView(
                    child: Container(
                        padding: EdgeInsets.only(top: 50, bottom: 00),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(left: 35, right: 35),
                                  child: Column(children: [
                                    TextField(
                                      controller: _nameController,
                                      // style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                // color: Colors.white,
                                                ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color: Colors.black,
                                            ),
                                          ),
                                          hintText: " Full Name",
                                          // hintStyle: TextStyle(color: Colors.white),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    TextField(
                                      controller: _MobileCodeController,
                                      // style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                // color: Colors.white,
                                                ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color: Colors.black,
                                            ),
                                          ),
                                          hintText: "Mobile Number",
                                          //  hintStyle: TextStyle(color: Colors.white),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    TextField(
                                      controller: _addressController,
                                      // style: TextStyle(color: Colors.white),
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                // color: Colors.white,
                                                ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color: Colors.black,
                                            ),
                                          ),
                                          hintText: "Address",
                                          // hintStyle: TextStyle(color: Colors.white),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    TextField(
                                      controller: _cityController,
                                      // style: TextStyle(color: Colors.white),
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                // color: Colors.white,
                                                ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color: Colors.black,
                                            ),
                                          ),
                                          hintText: "City",
                                          // hintStyle: TextStyle(color: Colors.white),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    TextField(
                                      controller: _StateCodeController,
                                      // style: TextStyle(color: Colors.white),
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                // color: Colors.white,
                                                ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color: Colors.black,
                                            ),
                                          ),
                                          hintText: "State/Province/Region",
                                          // hintStyle: TextStyle(color: Colors.white),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    TextField(
                                      controller: _postalCodeController,
                                      // style: TextStyle(color: Colors.white),
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                // color: Colors.white,
                                                ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color: Colors.black,
                                            ),
                                          ),
                                          hintText: "Zin Code(Postal Code)",
                                          // hintStyle: TextStyle(color: Colors.white),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    DropdownButtonFormField<String>(
                                      value: _country,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _country = newValue!;
                                        });
                                      },
                                      items: _countryList.map((country) {
                                        return DropdownMenuItem<String>(
                                          value: country,
                                          child: Text(country),
                                        );
                                      }).toList(),
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    MaterialButton(
                                        color: Colors.deepPurple,
                                        onPressed: () {},
                                        child: Text(
                                          "Add Address",
                                          style: TextStyle(color: Colors.black),
                                        ))
                                  ]))
                            ])))
              ]),
            )
          ]),
        ));
  }
}
