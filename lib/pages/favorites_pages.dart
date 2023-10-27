import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/pages/categoryId.dart';
import 'package:myapp/views/detail_page.dart';
import 'package:myapp/views/home_page.dart';
import 'package:myapp/widgets/card_widget.dart';

class FavoritesPages extends StatefulWidget {
  const FavoritesPages({super.key});

  @override
  State<FavoritesPages> createState() => _FavoritesPagesState();
}

class _FavoritesPagesState extends State<FavoritesPages> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.purple),
            backgroundColor: Colors.white,
            title: Text(
              'MY PRODUCTS',
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_cart),
              )
            ],
            flexibleSpace: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.red, Colors.purple],
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft))),
            bottom: TabBar(
                indicatorColor: Colors.white,
                tabs: [Text('Wishlist'), Text('Shared'), Text('Viewed')]),
          ),
          body: TabBarView(children: [
            Column(
              children: [
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
              ],
            ),
            Column(
              children: [
                Image.asset(
                  'assets/images/shopping1.png',
                  scale: 2,
                ),
                Text(
                  'No Products shared',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
                Text(
                    'Tap on Share Button to share produect with friends or family'),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                    color: Colors.purple,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Text(
                      'View Products',
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
            Text(
              'Viewed on October 11',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ]),
        ));
  }
}
