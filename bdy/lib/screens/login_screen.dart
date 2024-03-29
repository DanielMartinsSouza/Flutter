import 'package:bdy/components/validator.dart';
import 'package:bdy/data/user_dao.dart';
import 'package:bdy/screens/home/initial_screen.dart';
import 'package:bdy/screens/register/register_login_screen.dart';
import 'package:bdy/themes/theme_colors.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _formLoginKey = GlobalKey<FormState>();

  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                    'Tela de Login',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            Form(
              key: _formLoginKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Divider(thickness: 2),
                      ),
                      Text(
                        "Entre ou Registre-se",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          validator: (String? value) {
                            if (Validator().valueValidator(value)) {
                              return 'Insira o nome do usuario';
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
                            label: Text("Nome de Usuário"),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, right: 16.0),
                            child: SizedBox(
                              height: 50,
                              width: 100,
                              child: ElevatedButton(
                                style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      ThemeColors.mainColor),
                                ),
                                onPressed: () async {
                                  if (_formLoginKey.currentState!.validate()) {
                                    var login = await UserDao().login(
                                        _userController.text,
                                        _passwordController.text);
                                    if (login.isEmpty) {
                                      print("Login errado");
                                    } else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (contextInitialScreen) =>
                                              InitialScreen(),
                                        ),
                                      ).then((value) => Navigator.pop(context));
                                    }
                                  }
                                },
                                child: const Text("Logar"),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, left: 16.0),
                            child: SizedBox(
                              height: 50,
                              width: 100,
                              child: ElevatedButton(
                                style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      ThemeColors.mainColor),
                                ),
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'Você foi direcionado para tela de registro'),
                                    ),
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (contextNew) =>
                                          RegisterLoginScreen(),
                                    ),
                                  );
                                },
                                child: const Text('Registrar'),
                              ),
                            ),
                          )
                        ],
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
