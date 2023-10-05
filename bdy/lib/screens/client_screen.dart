import 'package:flutter/material.dart';
import '../components/cards/client_card.dart';
import '../themes/theme_colors.dart';
import 'register/register_client.dart';

class ClientScreen extends StatefulWidget {
  const ClientScreen({super.key});

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clientes'),
      ),
      backgroundColor: ThemeColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(ThemeColors.mainColor),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content:
                          Text('Direcionado para tela de cadastro de clientes'),
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (contextNew) => RegisterClient(),
                    ),
                  );
                },
                child: const Text("Registrar um novo cliente"),
              ),
            ),
            const ClientCard(
              clientName: 'Daniel Martins de Souza',
              clientEmail: 'danielmartsouza@gmail.com',
              clientGender: 'Masculino',
              dateBirth: '13/11/2001',
              clientCPF: 47523820832,
              clientNumber: 993133015,
            ),
          ],
        ),
      ),
    );
  }
}
