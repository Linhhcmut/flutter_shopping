import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/src/blocs/home_bloc.dart';
import 'package:shop/src/blocs/login_bloc.dart';
import 'package:shop/src/constants/drawer_constant.dart';
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
      backgroundColor: colorBackground,
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text(
              "linhngtaynguyen@gmail.com",
              style: TextStyle(
                fontSize: fontSizeEmail,
                color: colorTextList,
                fontFamily: fontText,
              ),
            ),
            accountName: Text(
              "Welcome, Linh Nguyen",
              style: TextStyle(
                fontSize: fontSizeAccountName,
                color: colorAcountName,
                fontFamily: fontText,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/images/avatar.jpg"),
            ),
            decoration: BoxDecoration(color: colorBackground),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: paddingVerticalList,
            ),
            child: Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: colorBackground,
                  elevation: 0.0,
                ),
                onPressed: _ordersButtonPress,
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/icons/orders_drawer.png",
                      color: colorTextList,
                    ),
                    SizedBox(
                      width: widthsizeBox,
                    ),
                    Text(
                      "Orders",
                      style: TextStyle(
                        color: colorTextList,
                        fontSize: fontSizeText,
                        fontFamily: fontText,
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
                primary: colorBackground,
                elevation: 0.0,
              ),
              onPressed: _wishListButtonPress,
              child: Row(
                children: <Widget>[
                  Image.asset(
                    "assets/icons/wish_list_drawer.png",
                    color: colorTextList,
                  ),
                  SizedBox(
                    width: widthsizeBox,
                  ),
                  Text(
                    "Wish List",
                    style: TextStyle(
                      fontSize: fontSizeText,
                      color: colorTextList,
                      fontFamily: fontText,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: paddingVerticalList,
            ),
            child: Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: colorBackground,
                  elevation: 0.0,
                ),
                onPressed: _lastViewedButtonPress,
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/icons/last_view_drawer.png",
                      color: colorTextList,
                    ),
                    SizedBox(
                      width: widthsizeBox,
                    ),
                    Text(
                      "Last Viewed",
                      style: TextStyle(
                        color: colorTextList,
                        fontSize: fontSizeText,
                        fontFamily: fontText,
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
                primary: colorBackground,
                elevation: 0.0,
              ),
              onPressed: _shippingButtonPress,
              child: Row(
                children: <Widget>[
                  Image.asset(
                    "assets/icons/shipping_drawer.png",
                    color: colorTextList,
                  ),
                  SizedBox(
                    width: widthsizeBox,
                  ),
                  Text(
                    "Shipping Adress",
                    style: TextStyle(
                      fontSize: fontSizeText,
                      fontFamily: fontText,
                      color: colorTextList,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: paddingVerticalList,
            ),
            child: Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: colorBackground,
                  elevation: 0.0,
                ),
                onPressed: _languageButtonPress,
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/icons/language_drawer.png",
                      color: colorTextList,
                    ),
                    SizedBox(
                      width: widthsizeBox,
                    ),
                    Text(
                      "Language",
                      style: TextStyle(
                        fontSize: fontSizeText,
                        fontFamily: fontText,
                        color: colorTextList,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: paddingVerticalList),
            child: Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: colorBackground,
                  elevation: 0.0,
                ),
                onPressed: _settingButtonPress,
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/icons/setting_drawer.png",
                      color: colorTextList,
                    ),
                    SizedBox(
                      width: widthsizeBox,
                    ),
                    Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: fontSizeText,
                        color: colorTextList,
                        fontFamily: fontText,
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
                  primary: colorBackground, elevation: 0.0),
              onPressed: _helpButtonPress,
              child: Row(
                children: <Widget>[
                  Image.asset(
                    "assets/icons/help_drawer.png",
                    color: colorTextList,
                  ),
                  SizedBox(
                    width: widthsizeBox,
                  ),
                  Text(
                    "Help",
                    style: TextStyle(
                      fontSize: fontSizeText,
                      color: colorTextList,
                      fontFamily: fontText,
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
                  primary: colorBackground,
                  elevation: 0.0,
                ),
                onPressed: _lockoutPress,
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/icons/logout_drawer.png",
                      color: colorTextList,
                    ),
                    SizedBox(
                      width: widthsizeBox,
                    ),
                    Text(
                      "Log out",
                      style: TextStyle(
                        fontSize: fontSizeText,
                        color: colorTextList,
                        fontFamily: fontText,
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
  void _ordersButtonPress(){
    //continue...
  }
  void _wishListButtonPress(){
    //continue...
  }
  void _lastViewedButtonPress(){
    //continue...
  }
  void _shippingButtonPress(){
    //continue...
  }
  void _languageButtonPress(){
    //continue...
  }
  void _settingButtonPress(){
    //continue...
  }
  void _helpButtonPress(){
    //continue...
  }
}
