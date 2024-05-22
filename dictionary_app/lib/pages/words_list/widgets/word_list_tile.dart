import 'package:flutter/material.dart';

class WordListTile extends StatelessWidget {
  String? title;
  String? word;
  Function() onTap;

  WordListTile({
    super.key,
    required this.title,
    required this.word,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Center(child: Text(title!)),
    );
  }
}
