import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:homescreen/util/todo_db.dart';

class DatabaseService {
  Database? _db;

  Future<Database?> get database async {
    if(_db != null) {
      return _db;
    }
    _db = await _initialize();
    return _db;
  }

  Future<String> get fullPath async {
    const name = 'todo.db';
    final path = await getDatabasesPath();
    return join(path, name);
  }

  Future<Database> _initialize() async {
    final path = await fullPath;
    var database = await openDatabase(path,
    version: 1,
    onCreate: create,
    singleInstance: true,
    );
    return database;
  }

  Future<void> create(Database database, int version) async {
    await TodoDB().createTable(database);
  }

}
