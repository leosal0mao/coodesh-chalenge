part of 'word_bloc.dart';

abstract class WordState {}

class WordInitialState extends WordState {}

class WordLoadingState extends WordState {}

class WordFailureState extends WordState {
  final String message;

  WordFailureState({required this.message});
}

class WordNotFoundState extends WordState {
  final WordNotFound word;
  final String message;

  WordNotFoundState({required this.word, required this.message});
}

class WordSuccessState extends WordState {
  final Word data;
  final bool? isLoading;

  WordSuccessState({
    required this.data,
    this.isLoading = false,
  });
}
