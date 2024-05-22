import 'package:dictionary_app/pages/favorite_words/favorite_words_page.dart';
import 'package:dictionary_app/pages/home/home_page.dart';
import 'package:dictionary_app/pages/word/word_page.dart';
import 'package:dictionary_app/pages/word_history/word_history_page.dart';
import 'package:dictionary_app/pages/words_list/words_list_page.dart';
import 'package:dictionary_app/providers.dart';
import 'package:dictionary_app/repositories/words_repository.dart';
import 'package:flutter/material.dart';

final routes = {
  '/': (context) => HomePage(repository: getIt.get<WordsRepository>()),
  '/wordsList': (context) => const WordsListPage(),
  '/wordPage': (context) {
    // final word = ModalRoute.of(context)?.settings.arguments as String;
    final arguments =
        ModalRoute.of(context)?.settings.arguments as List<dynamic>;

    final String word = arguments[0];
    final String isFavorite = arguments[1];
    final bool booleanFavorite = isFavorite == '1' ? true : false;

    return WordPage(
      word: word,
      isFavorite: booleanFavorite,
    );
  },
  '/wordHistory': (context) => const WordHistoryPage(),
  '/favouriteWords': (context) => const FavoriteWordsPage(),
};
