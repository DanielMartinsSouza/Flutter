import 'package:bdy/components/cards/client_card.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ClientDao {
  Future<Database> getDatabase(table) async {
    final String path = join(await getDatabasesPath(), "cli.db");
    return openDatabase(
      path,
      onCreate: (db, version) {
        db.execute(table);
      },
      version: 1,
    );
  }

  static const String tableSql = """CREATE TABLE $_tablename(
    $_clientName TEXT,
    $_clientEmail TEXT,
    $_clientGender TEXT,
    $_dateBirth TEXT,
    $_clientCPF INTEGER,
    $_clientNumber INTEGER
  )""";

  static const String _tablename = "clientTable";
  static const String _clientName = "clientName";
  static const String _clientEmail = "clientEmail";
  static const String _clientGender = "clientGender";
  static const String _dateBirth = "dateBirth";
  static const String _clientCPF = "clientCPF";
  static const String _clientNumber = "clientNumber";

  List<ClientCard> toList(List<Map<String, dynamic>> clientMap) {
    final List<ClientCard> clientList = [];
    for (Map<String, dynamic> line in clientMap) {
      final ClientCard client = ClientCard(
        clientName: line[_clientName],
        clientEmail: line[_clientEmail],
        clientGender: line[_clientGender],
        dateBirth: line[_dateBirth],
        clientCPF: line[_clientCPF],
        clientNumber: line[_clientNumber],
      );
      clientList.add(client);
    }
    return clientList;
  }

  Map<String, dynamic> toMap(ClientCard client) {
    final Map<String, dynamic> clientMap = Map();
    clientMap[_clientName] = client.clientName;
    clientMap[_clientEmail] = client.clientEmail;
    clientMap[_clientGender] = client.clientGender;
    clientMap[_dateBirth] = client.dateBirth;
    clientMap[_clientCPF] = client.clientCPF;
    clientMap[_clientNumber] = client.clientNumber;
    return clientMap;
  }

  update(ClientCard client, String clientName) async {
    final Database db = await getDatabase(tableSql);
    Map<String, dynamic> clientMap = toMap(client);

    if (client.clientName != clientName) {
      delete(clientName);
      save(client);
    } else {
      return await db.update(
        _tablename,
        clientMap,
        where: '$_clientName = ?',
        whereArgs: [client.clientName],
      );
    }
  }

  save(ClientCard client) async {
    final Database db = await getDatabase(tableSql);
    var itemExist = await find(client.clientName);
    Map<String, dynamic> clientMap = toMap(client);

    if (itemExist.isEmpty) {
      return await db.insert(_tablename, clientMap);
    } else {
      print("cliente já existe");
    }
  }

  Future<List<ClientCard>> find(String clientName) async {
    final Database db = await getDatabase(tableSql);
    final List<Map<String, dynamic>> result = await db.query(
      _tablename,
      where: '$_clientName = ?',
      whereArgs: [clientName],
    );
    return toList(result);
  }

  Future<List<ClientCard>> findAll() async {
    final Database db = await getDatabase(tableSql);
    final List<Map<String, dynamic>> result = await db.query(_tablename);
    return toList(result);
  }

  delete(String clientName) async {
    final Database db = await getDatabase(tableSql);
    return await db.delete(
      _tablename,
      where: '$_clientName = ?',
      whereArgs: [clientName],
    );
  }
}
