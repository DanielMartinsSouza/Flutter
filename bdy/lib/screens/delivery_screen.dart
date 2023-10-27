import 'package:flutter/material.dart';
import '../components/cards/sale_card.dart';
import '../themes/theme_colors.dart';

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
              client: 'Daniel Martins de Souza',
              item: 'Malbec',
              brand: 'Oboticario',
              category: 'Perfume',
              value: 100,
              amount: 1,
              delivery: 0,
              pay: 0,
              status: 0,
            ),
            SaleCard(
              client: 'Daniel Martins de Souza',
              item: 'Malbec',
              brand: 'Oboticario',
              category: 'Perfume',
              value: 100,
              amount: 1,
              delivery: 1,
              pay: 1,
              status: 1,
            ),
          ],
        ),
      ),
    );
  }
}
