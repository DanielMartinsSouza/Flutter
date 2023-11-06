import 'package:bdy/data/client_dao.dart';
import 'package:bdy/screens/register/register_client.dart';
import 'package:flutter/material.dart';

import '../confirmation_dialog.dart';
import 'box_card.dart';
import '../content_division.dart';

class ClientCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16, left: 16, right: 16),
      child: BoxCard(
        boxContent: Column(
          children: [
            Text(
              clientName,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              clientEmail,
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
                          clientGender,
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
                          dateBirth,
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
                          clientCPF.toString(),
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
                          clientNumber.toString(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (contextClient) => RegisterClient(
                            client: ClientCard(
                              clientName: clientName,
                              clientEmail: clientEmail,
                              clientGender: clientGender,
                              dateBirth: dateBirth,
                              clientCPF: clientCPF,
                              clientNumber: clientNumber,
                            ),
                          ),
                        ),
                      );
                    },
                    icon: Icon(Icons.add_box)),
                IconButton(
                    onPressed: () {
                      showConfirmationDialog(
                        context,
                        title: "Deseja realmente excluir?",
                      ).then((value) async {
                        if (value) {
                          ClientDao().delete(clientName);
                        }
                      });
                    },
                    icon: Icon(Icons.delete)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
