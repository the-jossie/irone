import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '/screens/dashboard/articles_screen/index.dart';
import '/screens/dashboard/home_screen/index.dart';
import '/screens/dashboard/messages_screen/index.dart';
import '/screens/dashboard/services_screen/index.dart';

class DashLayoutViewModel extends BaseViewModel {
  int _currentTabIndex = 0;

  final _pages = [
    const HomeScreen(),
    const ServicesScreen(),
    const ArticlesScreen(),
    const MessagesScreen(),
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int get currentTabIndex => _currentTabIndex;
  List<Widget> get pages => _pages;
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void changeTabIndex(index) {
    _currentTabIndex = index;
    notifyListeners();
  }
}
