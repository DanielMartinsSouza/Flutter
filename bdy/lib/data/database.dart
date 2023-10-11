import 'package:bdy/data/brand_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), "t.db");
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(BrandDao.tableSql);
    },
    version: 1,
  );
}
