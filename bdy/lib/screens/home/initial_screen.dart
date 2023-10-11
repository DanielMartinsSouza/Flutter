import 'package:bdy/components/navigation_side_bar/side_bar.dart';
import 'package:bdy/themes/theme_colors.dart';
import 'package:flutter/material.dart';
import '../../components/cards/sale_card.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.backgroundColor,
      drawer: const SideBar(),
      appBar: AppBar(
        title: const Text('Historico de Vendas'),
      ),
      body: ListView(
        children: <SaleCard>[
          SaleCard(
            client: 'Daniel Martins de Souza de souza',
            item: 'Malbec',
            brand: 'Oboticario',
            category: 'Perfume',
            value: 100,
            amount: 1,
            delivery: true,
            pay: true,
            status: true,
          ),
          SaleCard(
            client: 'Daniel Martins de Souza',
            item: 'Malbec',
            brand: 'Oboticario',
            category: 'Perfume',
            value: 100,
            amount: 1,
            delivery: false,
            pay: false,
            status: false,
          ),
          SaleCard(
            client: 'Daniel Martins de Souza',
            item: 'Malbec',
            brand: 'Oboticario',
            category: 'Perfume',
            value: 100,
            amount: 1,
            delivery: true,
            pay: true,
            status: true,
          ),
          SaleCard(
            client: 'Daniel Martins de Souza',
            item: 'Malbec',
            brand: 'Oboticario',
            category: 'Perfume',
            value: 100,
            amount: 1,
            delivery: false,
            pay: false,
            status: false,
          ),
          SaleCard(
            client: 'Daniel Martins de Souza',
            item: 'Malbec',
            brand: 'Oboticario',
            category: 'Perfume',
            value: 100,
            amount: 1,
            delivery: true,
            pay: true,
            status: false,
          ),
        ],
      ),
    );
  }
}
