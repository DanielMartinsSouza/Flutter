import 'package:flutter/material.dart';
import '../components/product_card.dart';
import '../themes/theme_colors.dart';

class StockScreen extends StatefulWidget {
  const StockScreen({super.key});

  @override
  State<StockScreen> createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estoque'),
      ),
      backgroundColor: ThemeColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: ListView(
          children: <Widget>[
            ProductCard(
              productName: 'Malbec',
              amount: 5,
              value: 100,
              brand: 'Avon',
              category: 'Perfume',
            ),
            ProductCard(
              productName: 'Malbec',
              amount: 5,
              value: 100,
              brand: 'Avon',
              category: 'Perfume',
            ),
            ProductCard(
              productName: 'Malbec',
              amount: 5,
              value: 100,
              brand: 'Avon',
              category: 'Perfume',
            ),
            ProductCard(
              productName: 'Malbec',
              amount: 5,
              value: 100,
              brand: 'Avon',
              category: 'Perfume',
            ),
          ],
        ),
      ),
    );
  }
}
