part of 'word_history_bloc.dart';

abstract class WordHistoryEvent {}

class LoadWordsEvent extends WordHistoryEvent {
  final List<Word> data;
  LoadWordsEvent({required this.data});
}
