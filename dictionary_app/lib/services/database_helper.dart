import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = "wordsDatabase.db";
  static const _databaseVersion = 1;

  static const table = "words";
  static const columnId = "id";
  static const columnData = "word";
  static const isFavorite = "isFavorite";

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), _databaseName),
      onCreate: _onCreate,
      version: _databaseVersion,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $table($columnId INTEGER PRIMARY KEY, $columnData TEXT, $isFavorite INTEGER DEFAULT 0 NOT NULL)',
    );
    await _insertLines(db);
  }

  Future _insertLines(Database db) async {
    String jsonString =
        await rootBundle.loadString('assets/words_dictionary.json');
    Map<String, dynamic> map = json.decode(jsonString);
    List<Map<String, dynamic>> listOfMaps =
        map.entries.map((e) => {'word': e.key, 'isFavorite': e.value}).toList();
    for (var item in listOfMaps) {
      item[isFavorite] = 0;
      await db.insert(table, item);
    }
  }
}
