import 'package:flutter/material.dart';

import '/screens/dashboard/articles_screen/index.dart';
import '/screens/dashboard/home_screen/index.dart';
import '/screens/dashboard/messages_screen/index.dart';
import '/screens/dashboard/search_screen/index.dart';
import '/screens/dashboard/services_screen/index.dart';
import '/widgets/organisms/side_drawer.dart';

class Dashlayout extends StatefulWidget {
  static const routeName = 'dashboard';
  const Dashlayout({Key? key}) : super(key: key);

  @override
  _DashlayoutState createState() => _DashlayoutState();
}

class _DashlayoutState extends State<Dashlayout> {
  int tabIndex = 0;
  var pages = [
    const HomeScreen(),
    const ServicesScreen(),
    const ArticlesScreen(),
    const MessagesScreen(),
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: Container(
          padding: const EdgeInsets.only(left: 20),
          child: GestureDetector(
            onTap: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            child: const Image(
              image: AssetImage("assets/user-avatar.png"),
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, SearchScreen.routeName),
            child: Container(
              margin: const EdgeInsets.only(right: 22),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xffF9F6F4),
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Icon(
                Icons.search,
                size: 25,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: pages[tabIndex],
      drawer: Drawer(
        backgroundColor: Theme.of(context).primaryColor,
        child: const SideDrawer(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: tabIndex,
        onTap: (index) => setState(() {
          tabIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: tabIndex == 0
                  ? Theme.of(context).primaryColor
                  : Colors.black54,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.workspaces_outline,
              color: tabIndex == 1
                  ? Theme.of(context).primaryColor
                  : Colors.black54,
            ),
            label: "Services",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.article_outlined,
              color: tabIndex == 2
                  ? Theme.of(context).primaryColor
                  : Colors.black54,
            ),
            label: "Articles",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message_outlined,
              color: tabIndex == 3
                  ? Theme.of(context).primaryColor
                  : Colors.black54,
            ),
            label: "Messages",
          ),
        ],
      ),
    );
  }
}
