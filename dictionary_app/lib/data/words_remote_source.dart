import 'package:dictionary_app/services/my_local_storage.dart';
import 'package:http/http.dart' as http;

class WordsRemoteSource {
  final MyLocalStorage? localStorage;

  WordsRemoteSource(this.localStorage);

  Future<String> fetchData(String word) async {
    try {
      String? savedData = await localStorage?.getData(word);

      if (savedData != null) {
        return savedData;
      } else {
        final url =
            Uri.parse('https://api.dictionaryapi.dev/api/v2/entries/en/$word');
        final response = await http.get(url);

        localStorage?.saveData(word, response.body);
        return response.body;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
