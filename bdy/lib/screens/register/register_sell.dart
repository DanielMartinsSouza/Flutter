import 'package:bdy/components/cards/sale_card.dart';
import 'package:bdy/components/validator.dart';
import 'package:bdy/data/sell_dao.dart';
import 'package:bdy/themes/theme_colors.dart';
import 'package:flutter/material.dart';

class RegisterSell extends StatelessWidget {
  final SaleCard sell;
  RegisterSell({Key? key, required this.sell}) : super(key: key);

  final TextEditingController _clientController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _itemController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _deliveryController = TextEditingController();

  final _formSellKey = GlobalKey<FormState>();

  bool _edit = false;
  String client = "";

  void updateValue() {
    if (sell.client != "") {
      _edit = true;
      client = sell.client;
    }
    _amountController.text = sell.amount.toString();
    _brandController.text = sell.brand;
    _categoryController.text = sell.category;
    _clientController.text = sell.client;
    _deliveryController.text = sell.delivery.toString();
    _valueController.text = sell.value.toString();
    _itemController.text = sell.item.toString();
  }

  @override
  Widget build(BuildContext context) {
    updateValue();
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
                    } else {
                      if (value == "Retirada") {
                        _deliveryController.text = "0";
                        print(_deliveryController.text);
                      } else if (value == "Entrega") {
                        _deliveryController.text = "1";
                        print(_deliveryController.text);
                      }
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
                  child: _edit
                      ? ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(ThemeColors.mainColor),
                          ),
                          onPressed: () {
                            if (_formSellKey.currentState!.validate()) {
                              SellDao().update(
                                  SaleCard(
                                    client: _clientController.text,
                                    item: _itemController.text,
                                    brand: _brandController.text,
                                    category: _categoryController.text,
                                    value: int.parse(_valueController.text),
                                    amount: int.parse(_amountController.text),
                                    delivery:
                                        int.parse(_deliveryController.text),
                                    pay: sell.pay,
                                    status: sell.status,
                                  ),
                                  _itemController.text,
                                  _clientController.text);
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
                            if (_formSellKey.currentState!.validate()) {
                              SellDao().save(
                                SaleCard(
                                  client: _clientController.text,
                                  item: _itemController.text,
                                  brand: _brandController.text,
                                  category: _categoryController.text,
                                  value: int.parse(_valueController.text),
                                  amount: int.parse(_amountController.text),
                                  delivery: int.parse(_deliveryController.text),
                                  pay: 0,
                                  status: 0,
                                ),
                              );
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
