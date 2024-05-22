import 'package:flutter/material.dart';

class MeaningsContainer extends StatelessWidget {
  String? meaning;
  String? definition;
  MeaningsContainer({
    super.key,
    this.meaning,
    this.definition,
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
        padding: const EdgeInsets.all(12.0),
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Meaning:', style: TextStyle(fontSize: 35)),
            const SizedBox(height: 10),
            Text(
              'Meaning: ${meaning ?? 'Not available'} ',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(
              'Definition: ${definition ?? 'Not available'}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        )),
      ),
    );
  }
}
