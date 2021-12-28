import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/src/blocs/home_bloc.dart';
import 'package:shop/src/blocs/login_bloc.dart';
import 'package:shop/src/pages/login_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPageIndex = 0;
  PageController _pageController = PageController();

  HomeBloc _homeBloc = HomeBloc();
  final GlobalKey<ScaffoldState> _menuPress = GlobalKey<ScaffoldState>();

  void onTapped(int index) {
    log(index.toString());
    setState(() {
      _selectedPageIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 200),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _menuPress,
        drawer: Drawer(),
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              onPressed: _cartPress,
              icon: Icon(Icons.shopping_cart_outlined, color: Colors.black),
            ),
            IconButton(
              onPressed: _lockoutPress,
              icon: Icon(Icons.logout, color: Colors.black),
            ),
          ],
          leading: IconButton(
            onPressed: () {
              _menuPress.currentState.openDrawer();
            },
            icon: Icon(Icons.menu, color: Colors.black),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.black),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.black),
              label: "Person",
            )
          ],
          currentIndex: _selectedPageIndex,
          onTap: onTapped,
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedPageIndex = index;
            });
          },
          children: <Widget>[
            Container(color: Colors.black45),
            Container(color: Colors.blue),
            Container(color: Colors.green),
          ],
        ),
      ),
    );
  }

  void _cartPress() async {
    // continue....
  }
  void _lockoutPress() async {
    try {
      await _homeBloc.isUserLogOut();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Provider<LoginBloc>.value(
              value: LoginBloc(),
              child: LoginPage(),
            );
          },
        ),
      );
    } catch (_) {}
  }
}
