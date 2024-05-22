part of 'favorite_words_bloc.dart';

abstract class FavoriteWordsState {}

class FavoriteWordsInitial extends FavoriteWordsState {}

class FavoriteWordsLoading extends FavoriteWordsState {}

class FavoriteWordsFailure extends FavoriteWordsState {
  final String? message;

  FavoriteWordsFailure({this.message});
}

class FavoriteWordsSuccess extends FavoriteWordsState {
  final List<Map<String, dynamic>> data;

  FavoriteWordsSuccess({
    required this.data,
  });
}

class FavoriteWordSavedSuccess extends FavoriteWordsState {
  final String word;
  FavoriteWordSavedSuccess({required this.word});
}

class FavoriteWordDeletedSuccess extends FavoriteWordsState {
  final String word;
  FavoriteWordDeletedSuccess({required this.word});
}

class IsFavoriteSuccess extends FavoriteWordsState {
  bool isFavorite;
  IsFavoriteSuccess({required this.isFavorite});
}

class IsFavoriteState extends FavoriteWordsState {
  bool isFavorite;

  IsFavoriteState({required this.isFavorite});
}
