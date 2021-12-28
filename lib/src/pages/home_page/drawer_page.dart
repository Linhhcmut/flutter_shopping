import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/src/blocs/home_bloc.dart';
import 'package:shop/src/blocs/login_bloc.dart';
import 'package:shop/src/constants.dart';
import 'package:shop/src/pages/login_page.dart';

class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
   HomeBloc _homeBloc = HomeBloc();
   
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: colorBackgroundDrawer,
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text(
              "linhngtaynguyen@gmail.com",
              style: TextStyle(
                fontSize: fontSizeEmailDrawer,
                color: colorTextListDrawer,
                fontFamily: fontTextDrawer,
              ),
            ),
            accountName: Text(
              "Welcome, Linh Nguyen",
              style: TextStyle(
                fontSize: fontSizeAccountNameDrawer,
                color: colorAcountNameDrawer,
                fontFamily: fontTextDrawer,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/images/avatar.jpg"),
            ),
            decoration: BoxDecoration(color: colorBackgroundDrawer),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: paddingVerticalListDrawer,
            ),
            child: Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: colorBackgroundDrawer,
                  elevation: 0.0,
                ),
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/icons/orders_drawer.png",
                      color: colorTextListDrawer,
                    ),
                    SizedBox(
                      width: widthsizeBoxDrawer,
                    ),
                    Text(
                      "Orders",
                      style: TextStyle(
                        color: colorTextListDrawer,
                        fontSize: fontSizeTextDrawer,
                        fontFamily: fontTextDrawer,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: colorBackgroundDrawer,
                elevation: 0.0,
              ),
              onPressed: () {},
              child: Row(
                children: <Widget>[
                  Image.asset(
                    "assets/icons/wish_list_drawer.png",
                    color: colorTextListDrawer,
                  ),
                  SizedBox(
                    width: widthsizeBoxDrawer,
                  ),
                  Text(
                    "Wish List",
                    style: TextStyle(
                      fontSize: fontSizeTextDrawer,
                      color: colorTextListDrawer,
                      fontFamily: fontTextDrawer,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: paddingVerticalListDrawer,
            ),
            child: Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: colorBackgroundDrawer,
                  elevation: 0.0,
                ),
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/icons/last_view_drawer.png",
                      color: colorTextListDrawer,
                    ),
                    SizedBox(
                      width: widthsizeBoxDrawer,
                    ),
                    Text(
                      "Last Viewed",
                      style: TextStyle(
                        color: colorTextListDrawer,
                        fontSize: fontSizeTextDrawer,
                        fontFamily: fontTextDrawer,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: colorBackgroundDrawer,
                elevation: 0.0,
              ),
              onPressed: () {},
              child: Row(
                children: <Widget>[
                  Image.asset(
                    "assets/icons/shipping_drawer.png",
                    color: colorTextListDrawer,
                  ),
                  SizedBox(
                    width: widthsizeBoxDrawer,
                  ),
                  Text(
                    "Shipping Adress",
                    style: TextStyle(
                      fontSize: fontSizeTextDrawer,
                      fontFamily: fontTextDrawer,
                      color: colorTextListDrawer,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: paddingVerticalListDrawer,
            ),
            child: Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: colorBackgroundDrawer,
                  elevation: 0.0,
                ),
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/icons/language_drawer.png",
                      color: colorTextListDrawer,
                    ),
                    SizedBox(
                      width: widthsizeBoxDrawer,
                    ),
                    Text(
                      "Language",
                      style: TextStyle(
                        fontSize: fontSizeTextDrawer,
                        fontFamily: fontTextDrawer,
                        color: colorTextListDrawer,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: paddingVerticalListDrawer),
            child: Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: colorBackgroundDrawer,
                  elevation: 0.0,
                ),
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/icons/setting_drawer.png",
                      color: colorTextListDrawer,
                    ),
                    SizedBox(
                      width: widthsizeBoxDrawer,
                    ),
                    Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: fontSizeTextDrawer,
                        color: colorTextListDrawer,
                        fontFamily: fontTextDrawer,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: colorBackgroundDrawer, elevation: 0.0),
              onPressed: () {},
              child: Row(
                children: <Widget>[
                  Image.asset(
                    "assets/icons/help_drawer.png",
                    color: colorTextListDrawer,
                  ),
                  SizedBox(
                    width: widthsizeBoxDrawer,
                  ),
                  Text(
                    "Help",
                    style: TextStyle(
                      fontSize: fontSizeTextDrawer,
                      color: colorTextListDrawer,
                      fontFamily: fontTextDrawer,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: colorBackgroundDrawer,
                  elevation: 0.0,
                ),
                onPressed: _lockoutPress,
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/icons/logout_drawer.png",
                      color: colorTextListDrawer,
                    ),
                    SizedBox(
                      width: widthsizeBoxDrawer,
                    ),
                    Text(
                      "Log out",
                      style: TextStyle(
                        fontSize: fontSizeTextDrawer,
                        color: colorTextListDrawer,
                        fontFamily: fontTextDrawer,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
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
