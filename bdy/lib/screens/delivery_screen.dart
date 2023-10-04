import 'package:flutter/material.dart';

import '../themes/theme_colors.dart';
import 'home/initial_screen.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({super.key});

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entregas'),
      ),
      backgroundColor: ThemeColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: ListView(
          children: <SaleCard>[
            SaleCard(
              client: 'Daniel Martins de Souza de souza',
              item: 'Malbec',
              brand: 'Oboticario',
              category: 'Perfume',
              value: 100,
              amount: 1,
              delivery: true,
            ),
            SaleCard(
              client: 'Daniel Martins de Souza',
              item: 'Malbec',
              brand: 'Oboticario',
              category: 'Perfume',
              value: 100,
              amount: 1,
              delivery: false,
            ),
            SaleCard(
              client: 'Daniel Martins de Souza',
              item: 'Malbec',
              brand: 'Oboticario',
              category: 'Perfume',
              value: 100,
              amount: 1,
              delivery: true,
            ),
            SaleCard(
              client: 'Daniel Martins de Souza',
              item: 'Malbec',
              brand: 'Oboticario',
              category: 'Perfume',
              value: 100,
              amount: 1,
              delivery: false,
            ),
            SaleCard(
              client: 'Daniel Martins de Souza',
              item: 'Malbec',
              brand: 'Oboticario',
              category: 'Perfume',
              value: 100,
              amount: 1,
              delivery: true,
            ),
          ],
        ),
      ),
    );
  }
}