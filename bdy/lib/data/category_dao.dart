import 'package:bdy/components/cards/category_card.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CategoryDao {
  Future<Database> getDatabase(table) async {
    final String path = join(await getDatabasesPath(), "t2.db");
    return openDatabase(
      path,
      onCreate: (db, version) {
        db.execute(table);
      },
      version: 1,
    );
  }

  static const String tableSql = """CREATE TABLE $_tablename(
    $_categoryName TEXT
  )""";

  static const String _tablename = "categoryTable";
  static const String _categoryName = "categoryName";

  List<CategoryCard> toList(List<Map<String, dynamic>> categoryMap) {
    final List<CategoryCard> categoryList = [];
    for (Map<String, dynamic> line in categoryMap) {
      final CategoryCard category = CategoryCard(category: line[_categoryName]);
      categoryList.add(category);
    }
    return categoryList;
  }

  Map<String, dynamic> toMap(CategoryCard category) {
    final Map<String, dynamic> categoryMap = Map();
    categoryMap[_categoryName] = category.category;
    return categoryMap;
  }

  Future<List<CategoryCard>> findAll() async {
    final Database db = await getDatabase(tableSql);
    final List<Map<String, dynamic>> result = await db.query(_tablename);
    return toList(result);
  }

  Future<List<CategoryCard>> find(String category) async {
    final Database db = await getDatabase(tableSql);
    final List<Map<String, dynamic>> result = await db.query(
      _tablename,
      where: '$_categoryName = ?',
      whereArgs: [category],
    );
    return toList(result);
  }

  save(CategoryCard category) async {
    final Database db = await getDatabase(tableSql);
    var itemExist = await find(category.category);
    Map<String, dynamic> categoryMap = toMap(category);
    if (itemExist.isEmpty) {
      await db.insert(_tablename, categoryMap);
    } else {
      //categoria já existe
    }
  }

  delete(String categoryName) async {
    final Database db = await getDatabase(tableSql);
    return db.delete(
      _tablename,
      where: '$_categoryName = ?',
      whereArgs: [categoryName],
    );
  }
}
