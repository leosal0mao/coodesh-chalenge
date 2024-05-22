import 'dart:convert';

import 'package:dictionary_app/data/words_remote_source.dart';
import 'package:dictionary_app/services/my_local_storage.dart';

import '../services/database_helper.dart';

class WordsRepository {
  final WordsRemoteSource remoteSource;
  final MyLocalStorage localStorage;

  WordsRepository({
    required this.remoteSource,
    required this.localStorage,
  });

  Future<dynamic> getWord(String word) async {
    try {
      final String jsonData = await remoteSource.fetchData(word);
      final dynamic jsonList = jsonDecode(jsonData);

      if (jsonList is Map<String, dynamic>) {
        return jsonList;
      } else {
        Map<String, dynamic> wordValidData = jsonList.firstWhere(
          (element) => element['word'] == word,
          orElse: () => {},
        );

        return wordValidData;
      }
    } catch (e) {
      throw Exception('Error in method getWord $e');
    }
  }

  Future<List<Map<String, dynamic>>> loadWordsFromDatabase() async {
    try {
      final db = await DatabaseHelper.instance.database;

      List<Map<String, dynamic>> wordsList = await db.query('words');

      return wordsList;
    } catch (e) {
      throw Exception('error: $e');
    }
  }
}
