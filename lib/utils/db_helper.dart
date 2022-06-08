import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'tasks.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE tasks(id TEXT PRIMARY KEY, title TEXT, completed INTEGER)');
      },
      version: 1,
    );
  }

  static Future<void> insertTask(Map<String, Object> data) async {
    final database = await DBHelper.database();

    database.insert(
      'tasks',
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> fetchTasks() async {
    final database = await DBHelper.database();
    return database.query('tasks');
  }
}
