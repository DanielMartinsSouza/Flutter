import 'package:bdy/components/validator.dart';
import 'package:flutter/material.dart';
import '../../components/cards/brand_card.dart';
import '../../themes/theme_colors.dart';

class RegisterBrand extends StatelessWidget {
  RegisterBrand({super.key});
  final TextEditingController _brandController = TextEditingController();

  final _formBrandKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Marca'),
      ),
      backgroundColor: ThemeColors.backgroundColor,
      body: ListView(
        children: [
          Form(
            key: _formBrandKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Informações da Marca",
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
                        return 'Insira a marca';
                      }
                      return null;
                    },
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
                        if (_formBrandKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Marca registrado com sucesso'),
                            ),
                          );
                        }
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
