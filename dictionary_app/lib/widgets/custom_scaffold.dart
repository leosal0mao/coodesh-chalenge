import 'package:dictionary_app/pages/favorite_words/favorite_words_page.dart';
import 'package:dictionary_app/pages/word_history/word_history_page.dart';
import 'package:dictionary_app/pages/words_list/words_list_page.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatefulWidget {
  Widget body;

  CustomScaffold({super.key, required this.body});

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _children = <Widget>[
    WordsListPage(key: UniqueKey()),
    WordHistoryPage(key: UniqueKey()),
    FavoriteWordsPage(key: UniqueKey()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _children.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Word List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline_outlined),
            label: 'Favorites',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
