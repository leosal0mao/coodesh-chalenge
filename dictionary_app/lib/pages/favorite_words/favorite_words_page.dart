import 'package:dictionary_app/entities/word.dart';
import 'package:dictionary_app/pages/words_list/widgets/word_list_tile.dart';
import 'package:dictionary_app/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/failure_widget.dart';
import 'bloc/favorite_words_bloc.dart';

class FavoriteWordsPage extends StatefulWidget {
  const FavoriteWordsPage({super.key});

  @override
  State<FavoriteWordsPage> createState() => _FavoriteWordsPageState();
}

class _FavoriteWordsPageState extends State<FavoriteWordsPage> {
  var favoritewordsBloc = getIt.get<FavoriteWordsBloc>();
  List<Word> wordList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    favoritewordsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
      child: BlocProvider(
        create: (context) => favoritewordsBloc,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: BlocBuilder<FavoriteWordsBloc, FavoriteWordsState>(
                builder: (context, state) {
                  if (state is FavoriteWordsInitial) {
                    BlocProvider.of<FavoriteWordsBloc>(context)
                        .add(LoadFavoriteWordsEvent(data: []));
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is FavoriteWordsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is FavoriteWordsFailure) {
                    return FailureWidget(
                      error: state.message,
                    );
                  }

                  if (state is FavoriteWordsSuccess) {
                    return state.data.length > 0
                        ? ListView.builder(
                            itemCount: state.data.length,
                            itemBuilder: (context, index) {
                              final word = state.data[index].values
                                  .elementAt(1)
                                  .toString();
                              final isFavorite = state.data[index].values
                                  .elementAt(2)
                                  .toString();
                              return WordListTile(
                                title: word,
                                word: word,
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/wordPage',
                                    arguments: [word, isFavorite],
                                  );
                                },
                              );
                            },
                          )
                        : const Center(
                            child: Text(
                                'There is no words added to your favourites.',
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center),
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
