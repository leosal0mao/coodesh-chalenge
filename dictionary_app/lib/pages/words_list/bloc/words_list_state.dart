part of 'words_list_bloc.dart';

abstract class WordsListState {}

class WordsListInitial extends WordsListState {}

class WordsListLoading extends WordsListState {}

class WordsListFailure extends WordsListState {
  final String? message;

  WordsListFailure({this.message});
}

class WordsListSuccess extends WordsListState {
  final List<Map<String, dynamic>> data;
  final bool? isLoading;

  WordsListSuccess({
    required this.data,
    this.isLoading = false,
  });
}
