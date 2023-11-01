import 'package:bdy/components/navigation_side_bar/side_bar.dart';
import 'package:bdy/themes/theme_colors.dart';
import 'package:flutter/material.dart';
import '../../components/cards/sale_card.dart';
import '../../data/sell_dao.dart';

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
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: Icon(Icons.refresh)),
        ],
      ),
      body: FutureBuilder<List<SaleCard>>(
        future: SellDao().findAll(),
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
                        'Não tem nenhuma nenhuma venda',
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  ),
                );
              }
              return Text("Erro ao carregar marcas");
          }
        },
      ),
    );
  }
}
