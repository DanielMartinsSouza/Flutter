import 'package:bdy/components/cards/sale_card.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SellDao {
  Future<Database> getDatabase(table) async {
    final String path = join(await getDatabasesPath(), "te.db");
    return openDatabase(
      path,
      onCreate: (db, version) {
        db.execute(table);
      },
      version: 1,
    );
  }

  static const String tableSql = """CREATE TABLE $_tablename(
    $_client TEXT,
    $_item TEXT,
    $_brand TEXT,
    $_category TEXT,
    $_value INTEGER,
    $_amount INTEGER,
    $_delivery INTEGER,
    $_pay INTEGER,
    $_status INTEGER
  )""";

  static const String _tablename = "sellTable";
  static const String _client = "client";
  static const String _item = "item";
  static const String _brand = "brand";
  static const String _category = "category";
  static const String _value = "value";
  static const String _amount = "amount";
  static const String _delivery = "delivery";
  static const String _pay = "pay";
  static const String _status = "status";

  List<SaleCard> toList(List<Map<String, dynamic>> sellMap) {
    final List<SaleCard> sellList = [];
    for (Map<String, dynamic> line in sellMap) {
      final SaleCard sell = SaleCard(
        client: line[_client],
        item: line[_item],
        brand: line[_brand],
        category: line[_category],
        value: line[_value],
        amount: line[_amount],
        delivery: line[_delivery],
        pay: line[_pay],
        status: line[_status],
      );
      sellList.add(sell);
    }
    return sellList;
  }

  Map<String, dynamic> toMap(SaleCard sell) {
    final Map<String, dynamic> sellMap = Map();
    sellMap[_amount] = sell.amount;
    sellMap[_category] = sell.category;
    sellMap[_brand] = sell.brand;
    sellMap[_client] = sell.client;
    sellMap[_delivery] = sell.delivery;
    sellMap[_item] = sell.item;
    sellMap[_pay] = sell.pay;
    sellMap[_status] = sell.status;
    sellMap[_value] = sell.value;
    return sellMap;
  }

  update(SaleCard sell, String item, String client) async {
    final Database db = await getDatabase(tableSql);
    Map<String, dynamic> sellMap = toMap(sell);

    if (sell.item != item && sell.client != client) {
      delete(item, client);
      save(sell);
    } else {
      return await db.update(
        _tablename,
        sellMap,
        where: '$_item = ? AND $_client = ?',
        whereArgs: [sell.item, sell.client],
      );
    }
  }

  save(SaleCard sell) async {
    final Database db = await getDatabase(tableSql);
    Map<String, dynamic> sellMap = toMap(sell);

    return await db.insert(_tablename, sellMap);
  }

  Future<List<SaleCard>> find(String item, String client) async {
    final Database db = await getDatabase(tableSql);
    final List<Map<String, dynamic>> result = await db.query(
      _tablename,
      where: '$_item = ? AND $_client = ?',
      whereArgs: [item, client],
    );
    return toList(result);
  }

  Future<List<SaleCard>> findAll() async {
    final Database db = await getDatabase(tableSql);
    final List<Map<String, dynamic>> result = await db.query(_tablename);
    return toList(result);
  }

  delete(String item, String client) async {
    final Database db = await getDatabase(tableSql);
    return await db.delete(
      _tablename,
      where: '$_item = ? AND $_client = ?',
      whereArgs: [item, client],
    );
  }
}
