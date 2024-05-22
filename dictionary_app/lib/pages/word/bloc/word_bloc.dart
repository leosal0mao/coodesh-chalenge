import 'package:dictionary_app/entities/word.dart';
import 'package:dictionary_app/entities/word_not_found.dart';
import 'package:dictionary_app/repositories/favorite_words_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/words_repository.dart';

part 'word_state.dart';
part 'word_event.dart';

class WordBloc extends Bloc<WordEvent, WordState> {
  final WordsRepository wordsRepository;
  final FavoriteWordsRepository favoriteWordsRepository;

  WordBloc(
      {required this.wordsRepository, required this.favoriteWordsRepository})
      : super(WordInitialState()) {
    on<FetchWordEvent>(_onFetchWord);
  }

  Future<void> _onFetchWord(
    FetchWordEvent event,
    Emitter<WordState> emit,
  ) async {
    try {
      emit(WordLoadingState());
      final fetchedWord = await wordsRepository.getWord(event.word);

      if (fetchedWord.containsKey('word')) {
        final word = Word.fromMap(fetchedWord);
        emit(WordSuccessState(data: word));
      } else {
        final word = WordNotFound.fromMap(fetchedWord);
        emit(WordNotFoundState(
            message:
                'This word does not exist on the dictionary, do a new search',
            word: word));
      }
    } catch (e) {
      emit(WordFailureState(message: e.toString()));
    }
  }
}
