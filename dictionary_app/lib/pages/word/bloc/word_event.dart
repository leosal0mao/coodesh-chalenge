part of 'word_bloc.dart';

abstract class WordEvent {}

class FetchWordEvent extends WordEvent {
  String word;

  FetchWordEvent({required this.word});
}

class SaveToFavoriteEvent extends WordEvent {
  Word word;
  bool isFavorite;

  SaveToFavoriteEvent({required this.word, required this.isFavorite});
}

class WordEmptyEvent extends WordEvent {}
