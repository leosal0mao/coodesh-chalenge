import 'package:dictionary_app/repositories/words_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../entities/word.dart';

part 'words_list_event.dart';
part 'words_list_state.dart';

class WordsListBloc extends Bloc<WordsListEvent, WordsListState> {
  final WordsRepository wordsRepository;

  WordsListBloc({required this.wordsRepository}) : super(WordsListInitial()) {
    on<LoadWordsEvent>(_onLoadWords);
  }

  Future<void> _onLoadWords(
    LoadWordsEvent event,
    Emitter<WordsListState> emit,
  ) async {
    try {
      emit(WordsListLoading());
      final words = await wordsRepository.loadWordsFromDatabase();
      emit(WordsListSuccess(data: words));
    } catch (e) {
      emit(WordsListFailure(message: e.toString()));
    }
  }
}
