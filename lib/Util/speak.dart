import 'package:flutter_tts/flutter_tts.dart';

class Speak {
  Speak() {
    set();
  }
  FlutterTts flutterTts = FlutterTts();
  void set() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setSpeechRate(1.0);
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(1.0);
  }

  void speak(String text) async {
   await  flutterTts.speak(text);
  }
}
