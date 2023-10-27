import 'package:flutter/material.dart';
import 'package:myapp/pages/categort_pages.dart';
import 'package:myapp/pages/profile_pages.dart';
import 'package:myapp/views/cart_page.dart';

import '../views/home_page.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late TabController tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  List<Widget> myChilders = const [HomePage(), CategoryPages(), ProfilePages()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: tabController,
            children: myChilders),
        bottomNavigationBar: SizedBox(
          height: kBottomNavigationBarHeight,
          child: BottomAppBar(
            child: TabBar(
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                indicator: const UnderlineTabIndicator(
                    insets: EdgeInsets.only(bottom: kBottomNavigationBarHeight),
                    borderSide: BorderSide(color: Colors.red, width: 2)),
                labelColor: Colors.red,
                unselectedLabelColor: Colors.grey,
                controller: tabController,
                tabs: [
                  Tab(
                    iconMargin: EdgeInsets.only(bottom: 4),
                    icon: selectedIndex == 0
                        ? const Icon(Icons.home)
                        : const Icon(Icons.home),
                    child: const Text(
                      'Home',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  const Tab(
                    iconMargin: EdgeInsets.only(bottom: 4),
                    icon: Icon(Icons.category),
                    child: Text(
                      'category',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  const Tab(
                    iconMargin: EdgeInsets.only(bottom: 4),
                    icon: Icon(Icons.people),
                    child: Text(
                      'Account',
                      style:
                          TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
                    ),
                  )
                ]),
          ),
        ));
  }
}
