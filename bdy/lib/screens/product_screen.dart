import 'package:flutter/material.dart';
import '../components/product_card.dart';
import '../themes/theme_colors.dart';
import 'register/register_brand.dart';
import 'register/register_category.dart';
import 'register/register_product.dart';

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
                      content:
                          Text('Direcionado para tela de registro de produto'),
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (contextNew) => RegisterProduct(),
                    ),
                  );
                },
                child: const Text("Registrar um novo produto"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(ThemeColors.mainColor),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                          'Direcionado para tela de registro de categoria'),
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (contextNew) => RegisterCategory(),
                    ),
                  );
                },
                child: const Text("Registrar uma nova categoria"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(ThemeColors.mainColor),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content:
                          Text('Direcionado para tela de registro de marca'),
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (contextNew) => RegisterBrand(),
                    ),
                  );
                },
                child: const Text("Registrar uma nova marca"),
              ),
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
