class WordNotFound {
  String? title;
  String? message;
  String? resolution;

  WordNotFound({this.title, this.message, this.resolution});

  static WordNotFound fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return WordNotFound(
          title: json['title'],
          message: json['message'],
          resolution: json['resolution']);
    } else if (json is String) {
      return WordNotFound(message: json);
    } else {
      throw Exception('Error in method WordNotFound.fromJson');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['message'] = message;
    data['resolution'] = resolution;
    return data;
  }

  factory WordNotFound.fromMap(Map<String, dynamic> map) {
    return WordNotFound(
      title: map['title'] ?? '',
      message: map['message'] ?? '',
      resolution: map['resolution'] ?? '',
    );
  }
}
