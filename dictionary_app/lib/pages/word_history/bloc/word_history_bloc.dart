import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../entities/word.dart';
import '../../../repositories/word_history_repository.dart';

part 'word_history_event.dart';
part 'word_history_state.dart';

class WordHistoryBloc extends Bloc<WordHistoryEvent, WordHistoryState> {
  final WordHistoryRepository wordsRepository;

  WordHistoryBloc({required this.wordsRepository})
      : super(WordHistoryInitial()) {
    on<LoadWordsEvent>(_onLoadWords);
  }

  Future<void> _onLoadWords(
    LoadWordsEvent event,
    Emitter<WordHistoryState> emit,
  ) async {
    try {
      emit(WordHistoryLoading());
      var words = await wordsRepository.getAllItemsFromLocalStorage();
      emit(WordHistorySuccess(words: words));
    } catch (e) {
      emit(WordHistoryFailure(message: e.toString()));
    }
  }
}
