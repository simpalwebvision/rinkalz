import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:myapp/constants/themes.dart';
import 'package:myapp/controllers/itembag_controller.dart';
import 'package:myapp/controllers/product_controller.dart';
import 'package:myapp/drawer/about_drawer.dart.dart';
import 'package:myapp/drawer/contact_drawer.dart';
import 'package:myapp/drawer/faq_drawer.dart';
import 'package:myapp/drawer/screens/home/newarrival_drawer.dart';
import 'package:myapp/pages/SeeAllProductPage.dart';
import 'package:myapp/pages/favorites_pages.dart';
import 'package:myapp/views/detail_page.dart';
import 'package:myapp/widgets/chip_widget.dart';

import '../widgets/ads_banner_widget.dart';
import '../widgets/card_widget.dart';
import 'cart_page.dart';

final currentIndexProvider = StateProvider<int>((ref) {
  return 0;
});

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(proudctNotifierProvider);
    final currentIndex = ref.watch(currentIndexProvider);
    final itemBag = ref.watch(itemBagProvider);
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
              title: const Text('T SHIRT COLLECTION '),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewARRIVALDrawer()));
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AdsBannerWidget(),
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: const [
                  ChipWidget(chipLabel: 'ALL'),
                  ChipWidget(chipLabel: 'MEN TSHIRT'),
                  ChipWidget(chipLabel: 'WOMEN TSHIRT'),
                  ChipWidget(chipLabel: 'KIDS TSHIRT '),
                  // ChipWidget(chipLabel: 'WOMEN SHIRT & T SHIRTS'),
                  ChipWidget(chipLabel: 'TSHIRT'),
                ],
              ),
            ),
            const Gap(12),
            Row(
              children: [
                Text(
                  'T SHIRT COLLECTION',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 180, right: 00),
                    child: Text(
                      'See all',
                      style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SeeAllProductPage()));
                  },
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
              child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 15);
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailsPage(getIndex: index),
                            )),
                        child: SizedBox(
                          height: 160,
                          child: ProductCardWidget(productIndex: index),
                        ),
                      )),
            ),
            const Gap(12),
            Row(
              children: [
                Text(
                  'NEW ARRIVAL',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 240, right: 00),
                    child: Text(
                      'See all',
                      style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SeeAllProductPage()));
                  },
                )
              ],
            ),
            SizedBox(
              height: 11,
            ),
            SizedBox(
              height: 200,
              child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 15);
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailsPage(getIndex: index),
                            )),
                        child: SizedBox(
                          height: 160,
                          child: ProductCardWidget(productIndex: index),
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
