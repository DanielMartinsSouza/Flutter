import 'package:bdy/components/validator.dart';
import 'package:flutter/material.dart';
import '../../components/category_card.dart';
import '../../themes/theme_colors.dart';

class RegisterCategory extends StatelessWidget {
  RegisterCategory({super.key});
  final TextEditingController _categoryController = TextEditingController();

  final _formCategoryKey = GlobalKey<FormState>();

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
            key: _formCategoryKey,
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
                    validator: (String? value) {
                      if (Validator().valueValidator(value)) {
                        return 'Insira a categoria';
                      }
                      return null;
                    },
                    style: const TextStyle(color: ThemeColors.mainColor),
                    controller: _categoryController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      prefixIcon: Icon(Icons.category_rounded),
                      label: Text("Categoria"),
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
                        if (_formCategoryKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('categoria registrado com sucesso'),
                            ),
                          );
                        }
                      },
                      child: const Text("Registrar categoria"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: <CategoryCard>[
              CategoryCard(
                category: 'Perfume',
              ),
              CategoryCard(
                category: 'Perfume',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
