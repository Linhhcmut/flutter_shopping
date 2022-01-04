import 'package:flutter/material.dart';
import 'package:shop/src/constants/body_home_constant.dart';

class Home_Body extends StatefulWidget {
  @override
  _Home_BodyState createState() => _Home_BodyState();
}

class _Home_BodyState extends State<Home_Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: ListView(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: paddingListView),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.black45),
                suffixIcon: IconButton(
                  onPressed: _searchHomePagePress,
                  icon: Icon(
                    Icons.qr_code_scanner_outlined,
                    color: colorText,
                  ),
                ),
              ),
            ),
          ),
          Text(
            "Collections",
            style: TextStyle(
              color: colorText,
              fontFamily: fontText,
              fontSize: fontSizeTopic,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: paddingListView),
            child: Container(
              height: 130,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                      ),
                      height: 130,
                    ),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue,
                      ),
                      height: 130,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Text(
                "Featured Products",
                style: TextStyle(
                  color: colorText,
                  fontSize: fontSizeTopic,
                  fontWeight: FontWeight.bold,
                  fontFamily: fontText,
                ),
              ),
              Spacer(),
              Container(
                width: 75,
                height: 40,
                child: TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: Colors.blue,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  onPressed: _pressMoreButton,
                  child: Text(
                    "More",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: fontText,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _searchHomePagePress() {
    //continue...
  }
  void _pressMoreButton(){
    //continue...
  }
}
