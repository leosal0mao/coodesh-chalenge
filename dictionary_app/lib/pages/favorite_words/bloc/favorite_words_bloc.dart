import 'dart:async';

import 'package:dictionary_app/entities/word.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../repositories/favorite_words_repository.dart';

part 'favorite_words_state.dart';
part 'favorite_words_event.dart';

class FavoriteWordsBloc extends Bloc<FavoriteWordsEvent, FavoriteWordsState> {
  final FavoriteWordsRepository favoriteWordsRepository;

  FavoriteWordsBloc({required this.favoriteWordsRepository})
      : super(FavoriteWordsInitial()) {
    on<LoadFavoriteWordsEvent>(_onLoadWords);
    on<AddToFavoritesEvent>(_addWordToFavorites);
    on<DeleteFromFavoritesEvent>(_deleteWordFromFavorites);
    on<IsFavoriteEvent>(_isFavorite);
  }

  Future<void> _onLoadWords(
    LoadFavoriteWordsEvent event,
    Emitter<FavoriteWordsState> emit,
  ) async {
    try {
      emit(FavoriteWordsLoading());
      final words = await favoriteWordsRepository.getFavoriteWords();
      emit(FavoriteWordsSuccess(data: words));
    } catch (e) {
      emit(FavoriteWordsFailure(message: e.toString()));
    }
  }

  Future<void> _addWordToFavorites(
    AddToFavoritesEvent event,
    Emitter<FavoriteWordsState> emit,
  ) async {
    emit(FavoriteWordsLoading());

    final words = await favoriteWordsRepository.getFavoriteWords();
    List<dynamic> wordsList = words.map((wordMap) => wordMap['word']).toList();

    // Check if the words list contains the given word
    bool isAlreadyInFavorites = wordsList.contains(event.word);

    if (!isAlreadyInFavorites) {
      await favoriteWordsRepository.addWordToFavorites(event.word);

      emit(FavoriteWordSavedSuccess(word: event.word));
    } else {
      await favoriteWordsRepository.deleteWordFromFavorites(event.word);
      emit(FavoriteWordDeletedSuccess(word: event.word));
    }
  }

  Future<void> _deleteWordFromFavorites(
    DeleteFromFavoritesEvent event,
    Emitter<FavoriteWordsState> emit,
  ) async {
    await favoriteWordsRepository.deleteWordFromFavorites(event.word);

    emit(FavoriteWordDeletedSuccess(word: event.word));
  }

  Future<void> _isFavorite(
    IsFavoriteEvent event,
    Emitter<FavoriteWordsState> emit,
  ) async {
    emit(IsFavoriteState(isFavorite: event.isFavorite));
  }
}
