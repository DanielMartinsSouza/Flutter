import 'package:flutter/material.dart';
import '../components/box_card.dart';
import '../components/content_division.dart';
import '../themes/theme_colors.dart';
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

class ProductCard extends StatelessWidget {
  final String productName;
  final String brand;
  final String category;
  final int amount;
  final int value;
  const ProductCard({
    super.key,
    required this.productName,
    required this.brand,
    required this.category,
    required this.amount,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: BoxCard(
        boxContent: Column(
          children: [
            Text(
              productName,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: const ContentDivision(),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Text>[
                        Text(
                          'Quantidade: ',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          amount.toString(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Row(
                      children: <Text>[
                        Text(
                          'Valor: ',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          value.toString(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Row(
                      children: <Text>[
                        Text(
                          'Marca: ',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          brand,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Row(
                      children: <Text>[
                        Text(
                          'Categoria: ',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          category,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.add_box)),
                IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
