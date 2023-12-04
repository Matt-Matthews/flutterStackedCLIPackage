import 'package:sqflite/sqflite.dart';
import 'package:homescreen/services/database_service.dart';
import 'package:homescreen/model/todo.dart';

class TodoDB {
  final tableName = 'todos';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
      "id" INTEGER NOT NULL,
      "title" TEXT NOT NULL,
      PRIMARY KEY("id" AUTOINCREMENT)
      );"""
    );
  }

  Future<int?> create({required String title}) async {
    final database = await DatabaseService().database;
    return await database?.rawInsert(
      '''INSERT INTO $tableName (title) VALUES (?)''',
      [title],
    );
  }

  Future<List<Todo>?> fetchAll() async {
    final database = await DatabaseService().database;
    final todos = await database?.rawQuery('''
SELECT * FROM $tableName 
''');
return todos?.map((todo) => Todo.fromSqliteDatabase(todo)).toList();
  }
}

