import 'dart:async';
import '../services/database_helper.dart';

class FavoriteWordsRepository {
  Future<List<Map<String, dynamic>>> getFavoriteWords() async {
    try {
      final db = await DatabaseHelper.instance.database;
      final List<Map<String, dynamic>> maps =
          await db.query('words', where: 'isFavorite = ?', whereArgs: ['1']);
      if (maps.isEmpty) {
        return [];
      } else {
        return List.generate(maps.length, (i) => maps[i]);
      }
    } catch (e) {
      throw ('Error occurred while getting favorite words: $e');
    }
  }

  Future<void> addWordToFavorites(String word) async {
    try {
      final db = await DatabaseHelper.instance.database;

      await db.update(
        'words',
        {'isFavorite': 1},
        where: 'word = ?',
        whereArgs: [word],
      );
    } catch (e) {
      throw ('Error occurred while adding word to favorites: $e');
    }
  }

  Future<void> deleteWordFromFavorites(String word) async {
    try {
      final db = await DatabaseHelper.instance.database;
      await db.update(
        'words',
        {'isFavorite': 0},
        where: 'word = ?',
        whereArgs: [word],
      );
    } catch (e) {
      throw ('Error occurred while deleting word from favorites: $e');
    }
  }

  Future<bool> isFavorite(String word) async {
    try {
      final db = await DatabaseHelper.instance.database;
      final List<Map<String, dynamic>> maps =
          await db.query('words', where: 'word = ?', whereArgs: [word]);
      return maps.isNotEmpty;
    } catch (e) {
      throw ('Error occurred while checking if the word is a favorite: $e');
    }
  }
}
