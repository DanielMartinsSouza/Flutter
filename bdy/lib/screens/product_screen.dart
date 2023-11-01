import 'package:flutter/material.dart';
import '../components/cards/product_card.dart';
import '../data/product_dao.dart';
import '../themes/theme_colors.dart';
import 'register/register_product.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
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
                  builder: (contextInitialScreen) => RegisterProduct(
                      product: ProductCard(
                          productName: "",
                          brand: "",
                          category: "",
                          amount: 0,
                          value: 0)),
                ),
              ).then((value) => setState(() {}));
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      backgroundColor: ThemeColors.backgroundColor,
      body: FutureBuilder<List<ProductCard>>(
        future: ProductDao().findAll(),
        builder: (context, snapshot) {
          List<ProductCard>? products = snapshot.data;
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
              if (snapshot.hasData && products != null) {
                if (products.isNotEmpty) {
                  return ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {
                      final ProductCard product = products[index];
                      return product;
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
                        'Não tem nenhum produto',
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  ),
                );
              }
              return Text("Erro ao carregar os produtos");
          }
        },
      ),
    );
  }
}
