import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/src/blocs/login_bloc.dart';
import 'src/pages/home_page/home_page.dart';
import 'src/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder<FirebaseUser>(
          future: FirebaseAuth.instance.currentUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomePage();
            }
            return Provider<LoginBloc>.value(
              value: LoginBloc(),
              child: LoginPage(),
            );
          },
        ));
  }
}
