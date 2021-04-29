import 'package:eng_app_/Screens/Paint/canvas.dart';
import "package:flutter/material.dart";
import 'package:flutter_tts/flutter_tts.dart';

// ignore: must_be_immutable
class LettersScreen extends StatefulWidget {
  int indx;
  LettersScreen({
     this.indx=0,
  });
  @override
  _LettersScreenState createState() => _LettersScreenState();
}

class _LettersScreenState extends State<LettersScreen> {
  var letter = LettersScreen(
    indx: 65,
  );
  FlutterTts tts = FlutterTts();
  void speak(String text) {
    tts.setLanguage("en-US");
    tts.setPitch(1.2);
    tts.speak(text);
    tts.setVolume(1.0);
  }
    @override
    void initState() {
      super.initState();
      speak("A");
    }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [Colors.pinkAccent, Colors.blueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 2,
                  child: CircleAvatar(
                      child: GestureDetector(
                          onLongPress: () {
                            setState(() {
                              if (letter.indx != 65) {
                                letter.indx -= 1;
                              }
                              speak("${String.fromCharCode(letter.indx)}");
                            });
                          },
                          child: Text("${String.fromCharCode(letter.indx)}",
                              style: TextStyle(fontSize: 100)))),
                ),
              ],
            ),
            ClipRRect(borderRadius:BorderRadius.all(Radius.circular(30)),child: Container(child: Container(width:size.width,height:size.height*0.28,child: CustomCanvas())))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            letter.indx += 1;
            if (letter.indx > 90) {
              letter.indx = 65;
            }
          });
          speak("${String.fromCharCode(letter.indx)}");
        },
      ),
    );
  }
}
