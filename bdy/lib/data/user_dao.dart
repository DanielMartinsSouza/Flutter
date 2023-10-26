import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../components/user.dart';

class UserDao {
  Future<Database> getDatabase(table) async {
    final String path = join(await getDatabasesPath(), "us.db");
    return openDatabase(
      path,
      onCreate: (db, version) {
        db.execute(table);
      },
      version: 1,
    );
  }

  static const String tableSql = """CREATE TABLE $_tablename(
    $_user TEXT,
    $_password TEXT,
    $_confirmPassword TEXT
  )""";

  static const String _tablename = "userTable";
  static const String _user = "user";
  static const String _password = "password";
  static const String _confirmPassword = "confirmPassword";

  Map<String, dynamic> toMap(User user) {
    final Map<String, dynamic> userMap = Map();
    userMap[_user] = user.user;
    userMap[_password] = user.password;
    userMap[_confirmPassword] = user.confirmPassword;
    return userMap;
  }

  List<User> toList(List<Map<String, dynamic>> userMap) {
    final List<User> userList = [];
    for (Map<String, dynamic> line in userMap) {
      final User user = User(
        user: line[_user],
        password: line[_password],
        confirmPassword: line[_confirmPassword],
      );
      userList.add(user);
    }
    return userList;
  }

  save(User user) async {
    final Database db = await getDatabase(tableSql);
    Map<String, dynamic> userMap = toMap(user);
    return await db.insert(_tablename, userMap);
  }

  Future<List<User>> find(String user) async {
    final Database db = await getDatabase(tableSql);
    final List<Map<String, dynamic>> result = await db.query(
      _tablename,
      where: '$_user = ?',
      whereArgs: [user],
    );
    print(result);
    return toList(result);
  }

  Future<List<User>> login(String user, String password) async {
    final Database db = await getDatabase(tableSql);
    final List<Map<String, dynamic>> result = await db.query(
      _tablename,
      where: '$_user = ? AND $_password = ?',
      whereArgs: [user, password],
    );
    return toList(result);
  }
}
