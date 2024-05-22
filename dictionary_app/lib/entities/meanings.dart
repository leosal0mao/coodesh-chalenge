import 'dart:convert';
import 'package:dictionary_app/entities/definitions.dart';

class Meanings {
  String partOfSpeech;
  List<Definitions>? definitions;

  Meanings({required this.partOfSpeech, required this.definitions});

  Map<String, dynamic> toMap() {
    return {
      'partOfSpeech': partOfSpeech,
      'definitions': definitions?.map((x) => x.toMap()).toList(),
    };
  }

  factory Meanings.fromMap(Map<String, dynamic> map) {
    return Meanings(
      partOfSpeech: map['partOfSpeech'] ?? '',
      definitions: map['definitions'] != null
          ? (map['definitions'] as List)
              .map((x) => Definitions.fromMap(x))
              .toList()
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory Meanings.fromJson(String source) =>
      Meanings.fromMap(json.decode(source));
}
