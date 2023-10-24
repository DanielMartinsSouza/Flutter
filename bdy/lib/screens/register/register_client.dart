import 'package:bdy/components/cards/client_card.dart';
import 'package:bdy/data/client_dao.dart';
import 'package:flutter/material.dart';
import '../../components/validator.dart';
import '../../themes/theme_colors.dart';

class RegisterClient extends StatelessWidget {
  final ClientCard client;
  RegisterClient({super.key, required this.client});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _dateBirthController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  final _formClientKey = GlobalKey<FormState>();

  bool _edit = false;
  String clientName = "";

  void updateValue() {
    if (client.clientName != "") {
      _edit = true;
      clientName = client.clientName;
    }
    _nameController.text = client.clientName;
    _genderController.text = client.clientGender;
    _emailController.text = client.clientEmail;
    _dateBirthController.text = client.dateBirth;
    _cpfController.text = client.clientCPF.toString();
    _numberController.text = client.clientNumber.toString();
  }

  @override
  Widget build(BuildContext context) {
    updateValue();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Cliente'),
      ),
      backgroundColor: ThemeColors.backgroundColor,
      body: Form(
        key: _formClientKey,
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
                  controller: _nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    prefixIcon: Icon(Icons.person),
                    label: Text("Nome completo"),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: TextFormField(
                  validator: (String? value) {
                    if (Validator().valueValidator(value)) {
                      return 'Insira o email';
                    }
                    return null;
                  },
                  style: const TextStyle(color: ThemeColors.mainColor),
                  controller: _emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    prefixIcon: Icon(Icons.mail),
                    label: Text("Email"),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: TextFormField(
                  validator: (String? value) {
                    if (Validator().valueValidator(value)) {
                      return 'Insira o gênero';
                    }
                    return null;
                  },
                  style: const TextStyle(color: ThemeColors.mainColor),
                  controller: _genderController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    prefixIcon: Icon(Icons.person_pin),
                    label: Text("Gênero"),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: TextFormField(
                  validator: (String? value) {
                    if (Validator().valueValidator(value)) {
                      return 'Insira a data de nascimento';
                    }
                    return null;
                  },
                  style: const TextStyle(color: ThemeColors.mainColor),
                  controller: _dateBirthController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    prefixIcon: Icon(Icons.date_range_outlined),
                    label: Text("Nascimento (xx/xx/xxxx)"),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: TextFormField(
                  validator: (String? value) {
                    if (Validator().valueValidator(value)) {
                      return 'Insira o CPF';
                    }
                    return null;
                  },
                  style: const TextStyle(color: ThemeColors.mainColor),
                  controller: _cpfController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    prefixIcon: Icon(Icons.app_registration_rounded),
                    label: Text("CPF"),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: TextFormField(
                  validator: (String? value) {
                    if (Validator().valueValidator(value)) {
                      return 'Insira o celular';
                    }
                    return null;
                  },
                  style: const TextStyle(color: ThemeColors.mainColor),
                  controller: _numberController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    prefixIcon: Icon(Icons.phone_android),
                    label: Text("Celular"),
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
                            if (_formClientKey.currentState!.validate()) {
                              ClientDao().update(
                                ClientCard(
                                  clientName: _nameController.text,
                                  clientEmail: _emailController.text,
                                  clientGender: _genderController.text,
                                  dateBirth: _dateBirthController.text,
                                  clientCPF: int.parse(_cpfController.text),
                                  clientNumber:
                                      int.parse(_numberController.text),
                                ),
                                clientName,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text("Cliente atualizado com sucesso"),
                                ),
                              );
                              Navigator.pop(context);
                            }
                          },
                          child: const Text("Atualizar cliente"),
                        )
                      : ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(ThemeColors.mainColor),
                          ),
                          onPressed: () {
                            if (_formClientKey.currentState!.validate()) {
                              ClientDao().save(ClientCard(
                                clientName: _nameController.text,
                                clientEmail: _emailController.text,
                                clientGender: _genderController.text,
                                dateBirth: _dateBirthController.text,
                                clientCPF: int.parse(_cpfController.text),
                                clientNumber: int.parse(_numberController.text),
                              ));
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('Cliente registrado com sucesso'),
                                ),
                              );
                              Navigator.pop(context);
                            }
                          },
                          child: const Text("Registrar cliente"),
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
