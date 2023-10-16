import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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
