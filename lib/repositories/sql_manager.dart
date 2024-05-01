import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sql.dart';
import 'package:sqflite/sqlite_api.dart';

class SQLManager {
  static Future<void> createTables(sql.Database db) async {
    await db.execute("""CREATE TABLE favorites(
      id INTEGER PRIMARY KEY NOT NULL
    )
    """);
    await db.execute(""" CREATE TABLE wishlist(
      id INTEGER PRIMARY KEY
  )
  """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'shop.db',
      version: 1,
      onCreate: (db, version) async {
        await createTables(db);
      },
    );
  }

  //Favorites
  static Future<void> addFavorite(int id) async {
    final _db = await SQLManager.db();
    await _db.insert('favorites', {'id': id},
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<void> removeFavorite(int id) async {
    final _db = await db();
    await _db.delete('favorites', where: 'id = ?', whereArgs: [id]);
  }

  static Future<List<Map<String, dynamic>>> getFavorites() async {
    final _db = await db();
    final list = await _db.query('favorites');
    return list;
  }

  //Cart
  static Future<void> addToCart(int id) async {
    final db = await SQLManager.db();
    await db.insert('wishlist', {'id': id},
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<void> removeFromCart(int id) async {
    final db = await SQLManager.db();
    await db.delete('wishlist', where: 'id = ?', whereArgs: [id]);
  }

  static Future<List<Map<String, dynamic>>> getCart() async {
    final _db = await db();
    final list = await _db.query('wishlist');
    return list;
  }
}
