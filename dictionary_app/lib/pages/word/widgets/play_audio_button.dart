import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

// ignore: must_be_immutable
class PlayAudioButton extends StatefulWidget {
  String audioText;

  PlayAudioButton({super.key, required this.audioText});

  @override
  State<PlayAudioButton> createState() => _PlayAudioButtonState();
}

class _PlayAudioButtonState extends State<PlayAudioButton> {
  final FlutterTts flutterTts = FlutterTts();
  @override
  void initState() {
    super.initState();
    flutterTts.setLanguage("en-US");
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.play_arrow),
      color: Colors.deepPurple,
      iconSize: 40,
      onPressed: () async {
        await flutterTts.speak(widget.audioText);
      },
    );
  }
}
