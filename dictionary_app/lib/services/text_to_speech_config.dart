import 'package:http/http.dart' as http;

Future speakText(String text) async {
  final response = await http.post(
    Uri.parse('https://responsivevoice.org/api/'),
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: {
      'key': 'Act5qru8',
      'hl': 'en-US',
      'text': text,
      'voice': 'US English Female',
      'rate': '1',
    },
  );

  if (response.statusCode == 200) {
    print('Text spoken successfully');
  } else {
    print('Error speaking text: ${response.body}');
  }
}
