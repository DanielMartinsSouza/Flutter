import 'package:bdy/components/cards/category_card.dart';
import 'package:bdy/screens/register/register_category.dart';
import 'package:flutter/material.dart';

import '../data/category_dao.dart';
import '../themes/theme_colors.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
                  builder: (contextInitialScreen) => RegisterCategory(),
                ),
              ).then((value) => setState(() {}));
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      backgroundColor: ThemeColors.backgroundColor,
      body: FutureBuilder<List<CategoryCard>>(
        future: CategoryDao().findAll(),
        builder: (context, snapshot) {
          List<CategoryCard>? categories = snapshot.data;
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
              if (snapshot.hasData && categories != null) {
                if (categories.isNotEmpty) {
                  return ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      final CategoryCard category = categories[index];
                      return category;
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
                        'Não tem nenhuma categoria',
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  ),
                );
              }
              return Text("Erro ao carregar as categorias");
          }
        },
      ),
    );
  }
}
