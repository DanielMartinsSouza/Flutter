import 'package:bdy/data/product_dao.dart';
import 'package:bdy/screens/register/register_product.dart';
import 'package:flutter/material.dart';

import 'box_card.dart';
import '../content_division.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final String brand;
  final String category;
  final int amount;
  final double value;
  ProductCard({
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
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (contextProduct) => RegisterProduct(
                              product: ProductCard(
                                  productName: productName,
                                  brand: brand,
                                  category: category,
                                  amount: amount,
                                  value: value)),
                        ),
                      );
                    },
                    icon: const Icon(Icons.add_box)),
                IconButton(
                    onPressed: () {
                      ProductDao().delete(productName);
                    },
                    icon: const Icon(Icons.delete)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
