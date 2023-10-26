import 'package:bdy/components/user.dart';
import 'package:bdy/components/validator.dart';
import 'package:bdy/data/user_dao.dart';
import 'package:bdy/themes/theme_colors.dart';
import 'package:flutter/material.dart';

class RegisterLoginScreen extends StatelessWidget {
  RegisterLoginScreen({Key? key}) : super(key: key);

  final _formRegisterLoginKey = GlobalKey<FormState>();

  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                ),
                color: ThemeColors.mainColor,
              ),
              height: 250,
              width: 415,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Icon(
                      Icons.account_circle,
                      size: 75,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Tela de Registro',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            Form(
              key: _formRegisterLoginKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Divider(thickness: 2),
                      ),
                      Text(
                        "Registre-se no nosso aplicativo",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          validator: (String? value) {
                            if (Validator().valueValidator(value)) {
                              return 'Insira o nome do usuário';
                            }
                            return null;
                          },
                          style: const TextStyle(color: Colors.black),
                          controller: _userController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            prefixIcon: Icon(Icons.email_outlined),
                            label: Text("Nome do usuário"),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          validator: (String? value) {
                            if (Validator().valueValidator(value)) {
                              return 'Insira a senha';
                            }
                            return null;
                          },
                          style: const TextStyle(color: Colors.black),
                          controller: _passwordController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            prefixIcon: Icon(Icons.security_outlined),
                            label: Text("Senha"),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          validator: (String? value) {
                            if (Validator().valueValidator(value) ||
                                value != _passwordController.text) {
                              return 'Senha distinta';
                            }
                            return null;
                          },
                          style: const TextStyle(color: Colors.black),
                          controller: _confirmPasswordController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            prefixIcon: Icon(Icons.password),
                            label: Text("Confirmar Senha"),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: SizedBox(
                          height: 50,
                          width: 100,
                          child: ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  ThemeColors.mainColor),
                            ),
                            onPressed: () {
                              if (_formRegisterLoginKey.currentState!
                                      .validate() &&
                                  _passwordController.text ==
                                      _confirmPasswordController.text) {
                                UserDao().save(User(
                                  user: _userController.text,
                                  password: _passwordController.text,
                                  confirmPassword:
                                      _confirmPasswordController.text,
                                ));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Registrado com sucesso'),
                                  ),
                                );
                                Navigator.pop(context);
                              }
                            },
                            child: const Text("Registrar"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
