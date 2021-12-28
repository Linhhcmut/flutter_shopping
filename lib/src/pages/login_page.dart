import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/src/blocs/login_bloc.dart';
import 'package:shop/src/pages/home_page/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePass;

  LoginBloc _loginBloc = LoginBloc();

  TextEditingController _txtemailController = TextEditingController();
  TextEditingController _txtpassController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _obscurePass = true;
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    var loginBloc = Provider.of<LoginBloc>(context);
    _txtemailController.addListener(() {
      loginBloc.isValidEmail(_txtemailController.text);
    });
    _txtpassController.addListener(() {
      loginBloc.isValidPassword(_txtpassController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Consumer<LoginBloc>(
          builder: (context, loginBloc, child) => Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/logo_login.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Welcome back!",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: StreamBuilder(
                    stream: loginBloc.userStream,
                    builder: (context, snapshot) {
                      return TextField(
                        controller: _txtemailController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email_outlined),
                          errorText: snapshot.hasError ? snapshot.error : null,
                          hintText: "example@gmail.com",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                StreamBuilder(
                  stream: loginBloc.passStream,
                  builder: (context, snapshot) {
                    return TextField(
                      obscureText: _obscurePass,
                      controller: _txtpassController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline),
                        hintText: "password",
                        errorText: snapshot.hasError ? snapshot.error : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscurePass = !_obscurePass;
                            });
                          },
                          icon: Icon(_obscurePass
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                    alignment: Alignment.topRight,
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 35),
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        primary: Color(0xff1a4f8b),
                      ),
                      onPressed: _loginButtonPress,
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Text(
                  "Or connect with social",
                  style: TextStyle(fontSize: 13),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: 160,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              primary: Color(0xff1a4f8b)),
                          onPressed: () {},
                          child: Text(
                            "Facebook",
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 160,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              primary: Color(0xfff14436)),
                          onPressed: () {},
                          child: Text(
                            "Google",
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _loginButtonPress() async {
    try {
      bool login = await _loginBloc.signInWithEmailAndPassword(
          email: _txtemailController.text, password: _txtpassController.text);
      if (login) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      }
    } catch (_) {}
  }
}
