import 'package:flutter/material.dart';

import 'box_card.dart';

class BrandCard extends StatelessWidget {
  final String brand;

  const BrandCard({
    super.key,
    required this.brand,
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
            Text(
              brand,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.add_box)),
            IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}
