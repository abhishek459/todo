import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:to_do/utils/date_methods.dart';

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

  static Future<List<Map<String, dynamic>>> fetchTodaysTasks() async {
    final database = await DBHelper.database();
    String today = DateMethods.today();
    return await database
        // .rawQuery('SELECT * FROM tasks WHERE id LIKE \'%$today%\'');
        .query('tasks', where: "id LIKE ?", whereArgs: ['%$today%']);
  }

  static Future<List<Map<String, dynamic>>> fetchTasks() async {
    final database = await DBHelper.database();
    return await database.query('tasks');
  }

  static Future<void> insertTask(Map<String, Object> data) async {
    final database = await DBHelper.database();
    database.insert(
      'tasks',
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<void> markTaskAsComplete(String taskId) async {
    final database = await DBHelper.database();
    await database
        .rawUpdate('UPDATE tasks SET completed = 1 WHERE id = \'$taskId\'');
  }

  static Future<void> deleteTask(String taskId) async {
    final database = await DBHelper.database();
    await database.rawDelete('DELETE FROM tasks WHERE id = \'$taskId\'');
  }
}
