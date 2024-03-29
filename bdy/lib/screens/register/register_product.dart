import 'package:bdy/components/validator.dart';
import 'package:flutter/material.dart';
import '../../components/cards/product_card.dart';
import '../../data/product_dao.dart';
import '../../themes/theme_colors.dart';

class RegisterProduct extends StatelessWidget {
  final ProductCard product;
  RegisterProduct({super.key, required this.product});

  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _itemController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  final _formProductKey = GlobalKey<FormState>();
  bool _edit = false;
  String productName = "";

  void updateValue() {
    if (product.productName != "") {
      _edit = true;
      productName = product.productName;
    }
    _brandController.text = product.brand;
    _categoryController.text = product.category;
    _itemController.text = product.productName;
    _valueController.text = product.value.toString();
    _amountController.text = product.amount.toString();
  }

  @override
  Widget build(BuildContext context) {
    updateValue();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Produto'),
      ),
      backgroundColor: ThemeColors.backgroundColor,
      body: Form(
        key: _formProductKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Informações do Produto",
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
                    prefixIcon: Icon(Icons.add_business),
                    label: Text("Marca"),
                  ),
                  keyboardType: TextInputType.text,
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
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: TextFormField(
                  validator: (String? value) {
                    if (Validator().valueValidator(value)) {
                      return 'Insira a produto';
                    }
                    return null;
                  },
                  style: const TextStyle(color: ThemeColors.mainColor),
                  controller: _itemController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    prefixIcon: Icon(Icons.storefront_outlined),
                    label: Text("Produto"),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: TextFormField(
                  validator: (String? value) {
                    if (Validator().valueValidator(value)) {
                      return 'Insira o valor';
                    }
                    return null;
                  },
                  style: const TextStyle(color: ThemeColors.mainColor),
                  controller: _valueController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    prefixIcon: Icon(Icons.attach_money_outlined),
                    label: Text("Valor"),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: TextFormField(
                  validator: (String? value) {
                    if (Validator().valueValidator(value)) {
                      return 'Insira a quantidade';
                    }
                    return null;
                  },
                  style: const TextStyle(color: ThemeColors.mainColor),
                  controller: _amountController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    prefixIcon: Icon(Icons.plus_one_sharp),
                    label: Text("Quantidade"),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  height: 50,
                  width: 200,
                  child: _edit
                      ? ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(ThemeColors.mainColor),
                          ),
                          onPressed: () {
                            if (_formProductKey.currentState!.validate()) {
                              ProductDao().update(
                                ProductCard(
                                  brand: _brandController.text,
                                  category: _categoryController.text,
                                  productName: _itemController.text,
                                  value: double.parse(_valueController.text),
                                  amount: int.parse(_amountController.text),
                                ),
                                productName,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('Produto atualizado com sucesso'),
                                ),
                              );
                              Navigator.pop(context);
                            }
                          },
                          child: const Text("Atualizar produto"),
                        )
                      : ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(ThemeColors.mainColor),
                          ),
                          onPressed: () {
                            if (_formProductKey.currentState!.validate()) {
                              ProductDao().save(ProductCard(
                                brand: _brandController.text,
                                category: _categoryController.text,
                                productName: _itemController.text,
                                value: double.parse(_valueController.text),
                                amount: int.parse(_amountController.text),
                              ));
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('Produto registrado com sucesso'),
                                ),
                              );
                              Navigator.pop(context);
                            }
                          },
                          child: const Text("Registrar produto"),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
