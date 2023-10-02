import 'package:flutter/material.dart';

import '../../components/box_card.dart';
import '../../themes/theme_colors.dart';

class RegisterBrand extends StatelessWidget {
  RegisterBrand({super.key});
  final TextEditingController _brandController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Categoria'),
      ),
      backgroundColor: ThemeColors.backgroundColor,
      body: ListView(
        children: [
          Form(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Informações da Categoria",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: TextFormField(
                    style: const TextStyle(color: ThemeColors.mainColor),
                    controller: _brandController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      prefixIcon: Icon(Icons.category_rounded),
                      label: Text("Marca"),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    height: 50,
                    width: 400,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(ThemeColors.mainColor),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Marca registrado com sucesso'),
                          ),
                        );
                      },
                      child: const Text("Registrar Marca"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: <BrandCard>[
              BrandCard(
                brand: 'Avon',
              ),
              BrandCard(
                brand: 'Avon',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BrandCard extends StatelessWidget {
  final String brand;

  const BrandCard({
    super.key,
    required this.brand,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: BoxCard(
        boxContent: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              brand,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.add_box)),
            IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}
