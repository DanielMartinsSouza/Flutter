import 'package:bdy/screens/register/register_login_screen.dart';
import 'package:flutter/material.dart';

import '../components/product_card.dart';
import '../themes/theme_colors.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
      ),
      backgroundColor: ThemeColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(ThemeColors.mainColor),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Registrado com sucesso'),
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (contextNew) => RegisterLoginScreen(),
                    ),
                  );
                },
                child: const Text("Registrar um novo produto"),
              ),
            ),
            ProductCard(
              productName: 'Malbec',
              amount: 5,
              value: 100,
            ),
            ProductCard(
              productName: 'Malbec',
              amount: 5,
              value: 100,
            ),
            ProductCard(
              productName: 'Malbec',
              amount: 5,
              value: 100,
            ),
            ProductCard(
              productName: 'Malbec',
              amount: 5,
              value: 100,
            ),
            ProductCard(
              productName: 'Malbec',
              amount: 5,
              value: 100,
            ),
            ProductCard(
              productName: 'Malbec',
              amount: 5,
              value: 100,
            ),
            ProductCard(
              productName: 'Malbec',
              amount: 5,
              value: 100,
            ),
            ProductCard(
              productName: 'Malbec',
              amount: 5,
              value: 100,
            ),
            ProductCard(
              productName: 'Malbec',
              amount: 5,
              value: 100,
            ),
            ProductCard(
              productName: 'Malbec',
              amount: 5,
              value: 100,
            ),
          ],
        ),
      ),
    );
  }
}
