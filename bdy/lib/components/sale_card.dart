import 'package:flutter/material.dart';
import 'box_card.dart';
import 'content_division.dart';

class SaleCard extends StatelessWidget {
  final String client;
  final String item;
  final String brand;
  final String category;
  final int value;
  final int amount;
  final bool delivery;
  final bool pay;

  const SaleCard({
    Key? key,
    required this.client,
    required this.item,
    required this.brand,
    required this.category,
    required this.value,
    required this.amount,
    required this.delivery,
    required this.pay,
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
                    Row(
                      children: [
                        SizedBox(
                          width: 110,
                          child: Text('Pagamento:'),
                        ),
                        Expanded(
                          child: Text(
                            (pay == true) ? 'Em receber' : 'Pago',
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
