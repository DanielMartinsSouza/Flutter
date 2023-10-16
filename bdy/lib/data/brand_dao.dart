import 'package:bdy/components/cards/brand_card.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BrandDao {
  Future<Database> getDatabase(table) async {
    final String path = join(await getDatabasesPath(), "t.db");
    return openDatabase(
      path,
      onCreate: (db, version) {
        db.execute(table);
      },
      version: 1,
    );
  }

  static const String tableSql = """CREATE TABLE $_tablename(
  $_brandName TEXT
)""";

  static const String _tablename = "brandTable";
  static const String _brandName = "brandName";

  save(BrandCard brand) async {
    print('Dentro de save');
    final Database db = await getDatabase(tableSql);
    var itemExist = await find(brand.name);
    Map<String, dynamic> brandMap = toMap(brand);

    if (itemExist.isEmpty) {
      print('sem marca');
      return await db.insert(_tablename, brandMap);
    } else {
      print('marca existe');
    }
  }

  Future<List<BrandCard>> findAll() async {
    print('dentro do findAll');
    final Database db = await getDatabase(tableSql);
    final List<Map<String, dynamic>> result = await db.query(_tablename);
    print(result);
    return toList(result);
  }

  Future<List<BrandCard>> find(String brand) async {
    print('dentro do find');
    final Database db = await getDatabase(tableSql);
    final List<Map<String, dynamic>> result = await db.query(
      _tablename,
      where: '$_brandName = ?',
      whereArgs: [brand],
    );
    print(toList(result));
    return toList(result);
  }

  delete(String brandName) async {
    print('Dentro do delete');
    final Database db = await getDatabase(tableSql);
    return await db.delete(
      _tablename,
      where: '$_brandName = ?',
      whereArgs: [brandName],
    );
  }

  List<BrandCard> toList(List<Map<String, dynamic>> brandMap) {
    print('Dentro do toList');
    final List<BrandCard> brandList = [];
    for (Map<String, dynamic> linha in brandMap) {
      print(brandList);
      final BrandCard brand = BrandCard(linha[_brandName]);
      brandList.add(brand);
    }
    print(brandList);
    return brandList;
  }

  Map<String, dynamic> toMap(BrandCard brand) {
    print('dentro do toMap');
    final Map<String, dynamic> brandMap = Map();
    brandMap[_brandName] = brand.name;
    print(brandMap);
    return brandMap;
  }
}
