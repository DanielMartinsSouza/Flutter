import 'package:bdy/components/box_card.dart';
import 'package:flutter/material.dart';
import '../components/content_division.dart';
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

class ClientCard extends StatefulWidget {
  final String clientName;
  final String clientEmail;
  final String clientGender;
  final String dateBirth;
  final int clientCPF;
  final int clientNumber;
  const ClientCard({
    super.key,
    required this.clientName,
    required this.clientEmail,
    required this.clientGender,
    required this.dateBirth,
    required this.clientCPF,
    required this.clientNumber,
  });

  @override
  State<ClientCard> createState() => _ClientCardState();
}

class _ClientCardState extends State<ClientCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16, left: 16, right: 16),
      child: BoxCard(
        boxContent: Column(
          children: [
            Text(
              widget.clientName,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              widget.clientEmail,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: const ContentDivision(),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: <Text>[
                        Text(
                          'Gênero: ',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          widget.clientGender,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Row(
                      children: <Text>[
                        Text(
                          'Nascimento: ',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          widget.dateBirth,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Row(
                      children: <Text>[
                        Text(
                          'CPF: ',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          widget.clientCPF.toString(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Row(
                      children: <Text>[
                        Text(
                          'Celular: ',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          widget.clientNumber.toString(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.add_box)),
                IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
