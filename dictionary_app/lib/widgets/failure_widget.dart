import 'package:flutter/material.dart';

class FailureWidget extends StatelessWidget {
  String? error;
  FailureWidget({super.key, this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Text(
          'An error occurred. $error.',
          style: const TextStyle(color: Colors.red, fontSize: 20),
        ),
      ),
    );
  }
}
