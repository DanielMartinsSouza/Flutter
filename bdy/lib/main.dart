import 'package:bdy/screens/home/initial_screen.dart';
import 'package:bdy/screens/login_screen.dart';
import 'package:bdy/screens/register/register_login_screen.dart';
import 'package:bdy/themes/my_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DBY());
}

class DBY extends StatefulWidget {
  const DBY({Key? key}) : super(key: key);

  @override
  State<DBY> createState() => _DBYState();
}

class _DBYState extends State<DBY> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DBY',
      theme: myTheme,
      initialRoute: "login",
      routes: {
        "register": (context) => RegisterLoginScreen(),
        "login": (context) => LoginScreen(),
        "initial": (context) => InitialScreen(),
      },
    );
  }
}
