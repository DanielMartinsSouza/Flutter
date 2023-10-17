import 'package:bdy/components/cards/product_card.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ProductDao {
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
  $_brand TEXT,
  $_productName TEXT,
  $_category TEXT,
  $_amount INTEGER,
  $_value REAL
)""";

  static const String _tablename = "productTable";
  static const String _brand = "brand";
  static const String _productName = "productName";
  static const String _category = "category";
  static const String _amount = "amount";
  static const String _value = "value";

  List<ProductCard> toList(List<Map<String, dynamic>> productMap) {
    final List<ProductCard> productList = [];
    for (Map<String, dynamic> line in productMap) {
      final ProductCard product = ProductCard(
        productName: line[_productName],
        brand: line[_brand],
        category: line[_category],
        amount: line[_amount],
        value: line[_value],
      );
      productList.add(product);
    }
    return productList;
  }

  Map<String, dynamic> toMap(ProductCard product) {
    final Map<String, dynamic> productMap = Map();
    productMap[_productName] = product.productName;
    productMap[_brand] = product.brand;
    productMap[_category] = product.category;
    productMap[_amount] = product.amount;
    productMap[_value] = product.value;
    return productMap;
  }

  update(ProductCard product, String productName) async {
    final Database db = await getDatabase(tableSql);
    Map<String, dynamic> productMap = toMap(product);

    if (product.productName != productName) {
      delete(productName);
      save(product);
    } else {
      return await db.update(
        _tablename,
        productMap,
        where: '$_productName = ?',
        whereArgs: [product.productName],
      );
    }
  }

  save(ProductCard product) async {
    final Database db = await getDatabase(tableSql);
    //var itemExist = await find(product.productName);
    Map<String, dynamic> productMap = toMap(product);

    return await db.insert(_tablename, productMap);
  }

  Future<List<ProductCard>> find(String productName) async {
    final Database db = await getDatabase(tableSql);
    final List<Map<String, dynamic>> result = await db.query(
      _tablename,
      where: '$_productName = ?',
      whereArgs: [productName],
    );
    return toList(result);
  }

  Future<List<ProductCard>> findAll() async {
    final Database db = await getDatabase(tableSql);
    final List<Map<String, dynamic>> result = await db.query(_tablename);
    return toList(result);
  }

  delete(String productName) async {
    final Database db = await getDatabase(tableSql);
    return await db.delete(
      _tablename,
      where: '$_productName = ?',
      whereArgs: [productName],
    );
  }
}
