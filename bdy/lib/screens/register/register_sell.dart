import 'package:bdy/components/validator.dart';
import 'package:bdy/themes/theme_colors.dart';
import 'package:flutter/material.dart';

class RegisterSell extends StatelessWidget {
  RegisterSell({Key? key}) : super(key: key);

  final TextEditingController _clientController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _itemController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _deliveryController = TextEditingController();

  final _formSellKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Realizar Venda'),
      ),
      backgroundColor: ThemeColors.backgroundColor,
      body: Form(
        key: _formSellKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Informações do Cliente",
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
                      return 'Insira o nome';
                    }
                    return null;
                  },
                  style: const TextStyle(color: ThemeColors.mainColor),
                  controller: _clientController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    prefixIcon: Icon(Icons.person),
                    label: Text("Nome do Cliente"),
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
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
                      return 'Insira o produto';
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
                padding: EdgeInsets.only(top: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Informações da Venda",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: TextFormField(
                  validator: (String? value) {
                    if (Validator().valueValidator(value) ||
                        value != 'Retirada' && value != 'Entrega') {
                      return 'Insira Retirada ou Entrega';
                    }
                    return null;
                  },
                  style: const TextStyle(color: ThemeColors.mainColor),
                  controller: _deliveryController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    prefixIcon: Icon(Icons.delivery_dining_sharp),
                    label: Text("Retirada ou Entrega:"),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(ThemeColors.mainColor),
                    ),
                    onPressed: () {
                      if (_formSellKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Compra efetuada com sucesso'),
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Finalizar Compra"),
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