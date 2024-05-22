import 'package:dictionary_app/repositories/words_repository.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_scaffold.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key, this.repository});

  WordsRepository? repository;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: InkWell(
        onTap: () {
          // repository!.getWord('patience');
          Navigator.pushNamed(context, '/wordsList');
        },
        child: const Center(
          child: Text('HomePage'),
        ),
      ),
    );
  }
}
