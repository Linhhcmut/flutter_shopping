import 'package:flutter/material.dart';
import 'package:shop/src/constants/drawer_constant.dart';
import 'package:shop/src/pages/home_page/body/home_body.dart';
import 'package:shop/src/pages/home_page/drawer_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPageIndex = 0;
  PageController _pageController = PageController();

  final GlobalKey<ScaffoldState> _menuPress = GlobalKey<ScaffoldState>();

  //tab bottom bar
  void onTapped(int index) {
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
        drawer: DrawerPage(),
        appBar: appBar(),
        bottomNavigationBar: bottomBar(),
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedPageIndex = index;
            });
          },
          children: <Widget>[
            Home_Body(),
            Container(color: Colors.blue),
            Container(color: Colors.green),
            Container(color: Colors.red),
          ],
        ),
      ),
    );
  }

  Widget appBar() {
    return AppBar(
      backgroundColor: Colors.grey[100],
      elevation: 0.0,
      actions: <Widget>[
        IconButton(
          onPressed: _cartPress,
          icon: Image.asset(
            "assets/icons/cart_home.png",
            color: colorTextList,
          ),
        ),
      ],
      leading: IconButton(
        onPressed: () {
          _menuPress.currentState.openDrawer();
        },
        icon: Image.asset(
          "assets/icons/menu.png",
          color: colorTextList,
        ),
      ),
    );
  }

  Widget bottomBar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/icons/icon1_bottomBar.png",
            color: _selectedPageIndex == 0 ? Color(0xff00cbff) : Colors.black54,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/icons/icon2_bottomBar.png",
            color: _selectedPageIndex == 1 ? Color(0xff00cbff) : Colors.black54,
          ),
          label: "Collections",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/icons/icon3_bottomBar.png",
            color: _selectedPageIndex == 2 ? Color(0xff00cbff) : Colors.black54,
          ),
          label: "Featured",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/icons/icon4_bottomBar.png",
            color: _selectedPageIndex == 3 ? Color(0xff00cbff) : Colors.black54,
          ),
          label: "Person",
        )
      ],
      selectedItemColor: Color(0xff00cbff),
      currentIndex: _selectedPageIndex,
      onTap: onTapped,
    );
  }

  void _cartPress() async {
    // continue....
  }
}
