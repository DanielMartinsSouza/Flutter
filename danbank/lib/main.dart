import 'package:danbank/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Danbank());
}

class Danbank extends StatelessWidget {
const Danbank({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Danbank',
      home: Home(),
    );
  }
}