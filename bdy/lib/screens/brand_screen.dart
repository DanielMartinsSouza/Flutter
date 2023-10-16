import 'package:bdy/data/brand_dao.dart';
import 'package:bdy/screens/register/register_brand.dart';
import 'package:flutter/material.dart';
import '../../components/cards/brand_card.dart';
import '../../themes/theme_colors.dart';

class BrandScreen extends StatefulWidget {
  BrandScreen({super.key});

  @override
  State<BrandScreen> createState() => _BrandScreenState();
}

class _BrandScreenState extends State<BrandScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Marca'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: Icon(Icons.refresh)),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (contextInitialScreen) => RegisterBrand(),
                ),
              ).then((value) => setState(() {}));
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      backgroundColor: ThemeColors.backgroundColor,
      body: FutureBuilder<List<BrandCard>>(
        future: BrandDao().findAll(),
        builder: (context, snapshot) {
          List<BrandCard>? brands = snapshot.data;
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
              if (snapshot.hasData && brands != null) {
                if (brands.isNotEmpty) {
                  return ListView.builder(
                    itemCount: brands.length,
                    itemBuilder: (BuildContext context, int index) {
                      final BrandCard brand = brands[index];
                      return brand;
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
                        'Não tem nenhuma marca',
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
