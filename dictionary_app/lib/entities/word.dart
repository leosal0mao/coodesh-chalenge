import 'dart:convert';

import 'package:dictionary_app/entities/meanings.dart';

class Word {
  String? word;
  String? phonetic;
  String? origin;
  List<Meanings>? meanings;

  Word({
    this.word,
    this.phonetic,
    this.origin,
    this.meanings,
  });

  Map<String, dynamic> toMap() {
    return {
      'word': word,
      'phonetic': phonetic,
      'origin': origin,
      'meanings': meanings?.map((x) => x.toMap()).toList(),
    };
  }

  factory Word.fromMap(Map<String, dynamic> map) {
    return Word(
      word: map['word'] ?? '',
      phonetic: map['phonetic'] ?? '',
      origin: map['origin'] ?? '',
      meanings: map['meanings'] != null
          ? List<Map<String, dynamic>>.from(map['meanings'])
              .map((e) => Meanings.fromMap(e))
              .toList()
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  static Word fromJson(Map<String, dynamic> json) {
    return Word(
      word: json['word'] as String?,
      phonetic: json['phonetic'] as String?,
      origin: json['origin'] as String?,
      meanings: json['meanings'] != null
          ? (json['meanings'] as List<dynamic>)
              .map((e) => Meanings.fromMap(e as Map<String, dynamic>))
              .toList()
          : [],
    );
  }

  static List<Word> fromJsonList(List<dynamic> json) {
    return json.map((map) => Word.fromJson(map)).toList();
  }
}
