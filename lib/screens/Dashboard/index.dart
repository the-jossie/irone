import 'package:firebase_auth/firebase_auth.dart';
import 'package:irone/screens/Auth/LoginScreen.dart';
import 'package:irone/screens/Dashboard/ArticlesScreen/index.dart';
import 'package:irone/screens/Dashboard/HomeScreen/index.dart';
import 'package:irone/screens/Dashboard/MessagesScreen/index.dart';
import 'package:irone/screens/Dashboard/SearchScreen/index.dart';
import 'package:irone/screens/Dashboard/ServicesScreen/index.dart';
import 'package:irone/widgets/organisms/SideDrawer.dart';
import 'package:flutter/material.dart';

class Dashlayout extends StatelessWidget {
  const Dashlayout({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          return const Dashboard();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.only(left: 20),
          height: 39,
          width: 39,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
          ),
          child: GestureDetector(
            onTap: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            child: Image(
              image: NetworkImage(user.photoURL!),
              height: 39,
              width: 39,
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
