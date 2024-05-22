import 'dart:convert';

class Definitions {
  String? definition;
  String? partOfSpeech;

  Definitions({
    this.definition,
    this.partOfSpeech,
  });

  Map<String, dynamic> toMap() {
    return {
      'definition': definition,
      'partOfSpeech': partOfSpeech,
    };
  }

  factory Definitions.fromMap(Map<String, dynamic> map) {
    return Definitions(
      definition: map['definition'] ?? '',
      partOfSpeech: map['partOfSpeech'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Definitions.fromJson(String source) =>
      Definitions.fromMap(json.decode(source));
}
