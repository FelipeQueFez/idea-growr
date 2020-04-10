import 'package:idea_growr/setup.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  Future<Database> openDatabaseAsync() async {
    Database database = await openDatabase('my_db.db', version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE Ideas (id INTEGER PRIMARY KEY, userId TEXT, content TEXT)');
    });

    getItInstance.registerSingleton(database);

    return database;
  }

  Future closeDatabaseAsync(Database db) async {
    await db.close();
    getItInstance.unregister<Database>();
  }

  Future insertDatabaseSync(Database db, String userId, String content) async {
    await db.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO Ideas(userId, content) VALUES("$userId", "$content")');
      print('inserted1: $id1');
    });
  }

  Future<Map<String, dynamic>> selectUserIdDatabaseAsync(
      Database db, String userId) async {
    List<Map<String, dynamic>> list = await db.rawQuery(
        'SELECT id, userId, content FROM Ideas WHERE userId = "$userId"');
    if (list.length > 0)
      return list[0];
    else
      return null;
  }

  Future<int> updateUserIdDatabaseAsync(
      Database db, String userId, String content) async {
    int count = await db.rawUpdate(
        'UPDATE Ideas set content = "$content" WHERE userId = "$userId"');
    return count;
  }
}
