part of 'favorite_words_bloc.dart';

abstract class FavoriteWordsEvent {}

class LoadFavoriteWordsEvent extends FavoriteWordsEvent {
  final List<Word> data;
  LoadFavoriteWordsEvent({required this.data});
}

class AddToFavoritesEvent extends FavoriteWordsEvent {
  String word;

  AddToFavoritesEvent({required this.word});
}

class DeleteFromFavoritesEvent extends FavoriteWordsEvent {
  String word;

  DeleteFromFavoritesEvent({required this.word});
}

class IsFavoriteEvent extends FavoriteWordsEvent {
  bool isFavorite;
  IsFavoriteEvent({required this.isFavorite});
}
