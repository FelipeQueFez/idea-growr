import 'package:idea_growr/setup.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  Future<Database> openDatabaseAsync() async {

    Database database = await openDatabase('my_db.db', version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE Ideas (id INTEGER PRIMARY KEY, content TEXT)');
    });

    getItInstance.registerSingleton(database);

    return database;
  }

  Future closeDatabaseAsync(Database db) async {
    await db.close();
    getItInstance.unregister<Database>();
  }

  Future insertDatabaseSync(Database db, String content) async {
    await db.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO Ideas(content) VALUES("$content")');
      print('inserted1: $id1');
    });
  }

  Future<List<Map>> selectDatabaseAsync(Database db) async {
    List<Map> list = await db.rawQuery('SELECT * FROM Ideas');
    return list;
  }
}
