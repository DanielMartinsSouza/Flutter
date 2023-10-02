import 'package:bdy/components/navigation_side_bar/side_bar.dart';
import 'package:bdy/themes/theme_colors.dart';
import 'package:flutter/material.dart';

import '../../components/box_card.dart';
import '../../components/content_division.dart';

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
    );
  }
}

class SaleCard extends StatelessWidget {
  final String client;
  final String item;
  final String brand;
  final String category;
  final int value;
  final int amount;
  final bool delivery;

  const SaleCard({
    Key? key,
    required this.client,
    required this.item,
    required this.brand,
    required this.category,
    required this.value,
    required this.amount,
    required this.delivery,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 32.0, right: 32),
      child: BoxCard(
        boxContent: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        'Compra de $client',
                        style: Theme.of(context).textTheme.bodyMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const ContentDivision(),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Center(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 110,
                          child: Text('Cliente:'),
                        ),
                        Expanded(
                          child: Text(
                            client,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 110,
                          child: Text('Produto:'),
                        ),
                        Expanded(
                          child: Text(
                            item,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 110,
                          child: Text('Categoria:'),
                        ),
                        Expanded(
                          child: Text(
                            category,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 110,
                          child: Text('Valor:'),
                        ),
                        Expanded(
                          child: Text(
                            value.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 110,
                          child: Text('Quantidade:'),
                        ),
                        Expanded(
                          child: Text(
                            amount.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
