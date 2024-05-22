import 'dart:convert';

import 'package:dictionary_app/providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyLocalStorage {
  SharedPreferences prefs = getIt.get<SharedPreferences>();
  MyLocalStorage({required this.prefs});

  void saveData(String key, String value) async {
    String? word = await getData(key);

    if (word == null) {
      await prefs.setString(key, value);
    } else {
      await prefs.remove(key);
      await prefs.setString(key, value);
    }
  }

  Future<String?> getData(String key) async {
    final String? item = prefs.getString(key);
    return item;
  }

  Future<List<Map<String, dynamic>>> getAllLocalData() async {
    var keys = prefs.getKeys();
    List<Map<String, dynamic>> savedWord = [];

    for (var key in keys) {
      String? value = await getData(key);
      if (!value!.contains('title')) {
        List<dynamic> valuesList = jsonDecode(value);
        for (var wordMap in valuesList) {
          wordMap['key'] = key;
          savedWord.add(wordMap);
        }
      }
    }

    return savedWord;
  }
}
