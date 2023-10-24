import 'package:flutter/material.dart';
import '../components/cards/client_card.dart';
import '../data/client_dao.dart';
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
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: Icon(Icons.refresh)),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (contextInitialScreen) => RegisterClient(
                    client: ClientCard(
                      clientName: "",
                      clientEmail: "",
                      clientGender: "",
                      dateBirth: "",
                      clientCPF: 0,
                      clientNumber: 0,
                    ),
                  ),
                ),
              ).then((value) => setState(() {}));
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      backgroundColor: ThemeColors.backgroundColor,
      body: FutureBuilder<List<ClientCard>>(
        future: ClientDao().findAll(),
        builder: (context, snapshot) {
          List<ClientCard>? clients = snapshot.data;
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(
                child: Column(
                  children: [
                    CircularProgressIndicator(),
                    Text(
                      'Carregando',
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
              );
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  children: [
                    CircularProgressIndicator(),
                    Text(
                      'Carregando',
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
              );
            case ConnectionState.active:
              return Center(
                child: Column(
                  children: [
                    CircularProgressIndicator(),
                    Text(
                      'Carregando',
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
              );
            case ConnectionState.done:
              if (snapshot.hasData && clients != null) {
                if (clients.isNotEmpty) {
                  return ListView.builder(
                    itemCount: clients.length,
                    itemBuilder: (BuildContext context, int index) {
                      final ClientCard client = clients[index];
                      return client;
                    },
                  );
                }
                return Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 128,
                      ),
                      Text(
                        'Não tem nenhum cliente',
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  ),
                );
              }
              return Text("Erro ao carregar clientes");
          }
        },
      ),
    );
  }
}
