import 'package:bdy/components/box_card.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final int amount;
  final int value;
  const ProductCard({
    super.key,
    required this.productName,
    required this.amount,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: BoxCard(
        boxContent: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(Icons.store),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  productName,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
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
                )
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.add_box)),
            IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}
