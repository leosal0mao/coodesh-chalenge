part of 'word_history_bloc.dart';

abstract class WordHistoryState {}

class WordHistoryInitial extends WordHistoryState {}

class WordHistoryLoading extends WordHistoryState {}

class WordHistoryFailure extends WordHistoryState {
  final String? message;

  WordHistoryFailure({this.message});
}

class WordHistorySuccess extends WordHistoryState {
  final List<Map<String, dynamic>> words;
  final bool? isLoading;

  WordHistorySuccess({
    required this.words,
    this.isLoading = false,
  });
}
