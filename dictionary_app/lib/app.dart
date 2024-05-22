import 'package:dictionary_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/word/bloc/word_bloc.dart';
import 'pages/words_list/bloc/words_list_bloc.dart';
import 'providers.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WordsListBloc>(
            create: (context) => getIt<WordsListBloc>()),
        BlocProvider<WordBloc>(create: (context) => getIt<WordBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'dictionary app',
        theme: ThemeData(
          primarySwatch: Colors.amber,
          brightness: Brightness.dark,
        ),
        routes: routes,
      ),
    );
  }
}
