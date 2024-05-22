import 'package:dictionary_app/entities/word.dart';
import 'package:dictionary_app/pages/word/bloc/word_bloc.dart';
import 'package:dictionary_app/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/failure_widget.dart';
import '../words_list/widgets/word_list_tile.dart';
import 'bloc/word_history_bloc.dart';

class WordHistoryPage extends StatefulWidget {
  const WordHistoryPage({super.key});

  @override
  State<WordHistoryPage> createState() => _WordsHistoryPageState();
}

class _WordsHistoryPageState extends State<WordHistoryPage> {
  var wordHistoryBloc = getIt.get<WordHistoryBloc>();
  var wordBloc = getIt.get<WordBloc>();
  List<Word> wordList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    wordHistoryBloc.close(); //dispose unused bloc to prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredWords = [];

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
      child: BlocProvider(
        create: (context) => wordHistoryBloc,
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                // filteredWords = snapshot.data!.where((word) {
                //   return word['word']
                //       .toLowerCase()
                //       .contains(value.toLowerCase());
                // }).toList();
              },
              decoration: InputDecoration(
                labelText: 'Search word',
                hintText: 'Enter a word',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<WordHistoryBloc, WordHistoryState>(
                builder: (context, state) {
                  if (state is WordHistoryInitial) {
                    BlocProvider.of<WordHistoryBloc>(context)
                        .add(LoadWordsEvent(data: []));
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is WordHistoryLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is WordHistoryFailure) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(),
                        FailureWidget(
                          error: state.message,
                        )
                      ],
                    );
                  }
                  if (state is WordHistorySuccess) {
                    return ListView.builder(
                      itemCount: state.words.length,
                      itemBuilder: (context, index) {
                        final word = state.words[index]['key'].toString();
                        return WordListTile(
                          title: word,
                          word: word,
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/wordPage',
                              arguments: word,
                            );
                          },
                        );
                      },
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
