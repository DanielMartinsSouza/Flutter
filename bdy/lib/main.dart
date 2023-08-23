import 'package:bdy/screens/login_screen.dart';
import 'package:bdy/themes/my_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DBY());
}

class DBY extends StatelessWidget {
  const DBY({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DBY',
      theme: myTheme,
      home: LoginScreen(),
    );
  }
}
