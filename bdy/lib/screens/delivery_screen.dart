import 'package:flutter/material.dart';
import '../components/cards/sale_card.dart';
import '../data/sell_dao.dart';
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
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: Icon(Icons.refresh)),
        ],
      ),
      backgroundColor: ThemeColors.backgroundColor,
      body: FutureBuilder<List<SaleCard>>(
        future: SellDao().findDelivery(),
        builder: (context, snapshot) {
          List<SaleCard>? sells = snapshot.data;
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(
                child: Column(
                  children: [
                    CircularProgressIndicator(),
                    Text(
                      'Carregando',
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
              );
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  children: [
                    CircularProgressIndicator(),
                    Text(
                      'Carregando',
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
              );
            case ConnectionState.active:
              return Center(
                child: Column(
                  children: [
                    CircularProgressIndicator(),
                    Text(
                      'Carregando',
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
              );
            case ConnectionState.done:
              if (snapshot.hasData && sells != null) {
                if (sells.isNotEmpty) {
                  return ListView.builder(
                    itemCount: sells.length,
                    itemBuilder: (BuildContext context, int index) {
                      final SaleCard sell = sells[index];
                      return sell;
                    },
                  );
                }
                return Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 128,
                      ),
                      Text(
                        'Não tem nenhuma nenhuma entrega',
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  ),
                );
              }
              return Text("Erro ao carregar entregas");
          }
        },
      ),
    );
  }
}
