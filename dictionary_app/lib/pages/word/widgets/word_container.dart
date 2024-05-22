import 'package:flutter/material.dart';

class WordContainer extends StatelessWidget {
  String? word;
  String? phonetic;
  WordContainer({
    super.key,
    this.phonetic,
    this.word,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.purple,
          width: 2.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Column(
          children: [
            Text(
              word ?? 'Word not available',
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 20),
            Text(phonetic ?? 'Phonetic not available',
                style: const TextStyle(fontSize: 20)),
          ],
        )),
      ),
    );
  }
}
