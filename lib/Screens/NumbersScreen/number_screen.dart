import 'package:eng_lang/Screens/Paint/canvas.dart';
import "package:flutter/material.dart";
import 'package:flutter_tts/flutter_tts.dart';
import "../../Util/speak.dart";

class NumberScreen extends StatefulWidget {
  int indx;
  NumberScreen({
    this.indx = 0,
  });
  @override
  _NumberScreenState createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  var number = NumberScreen(indx: 48);
  FlutterTts tts = FlutterTts();

  void speak(String text) {
    tts.setLanguage("en-US");
    tts.setPitch(1.2);
    tts.speak(text);
    tts.setVolume(1.0);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Speak tts = Speak();
    tts.speak('B');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.yellowAccent, Colors.blueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Column(
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
                                  if (number.indx != 48) {
                                    number.indx -= 1;
                                  }
                                  speak("${String.fromCharCode(number.indx)}");
                                });
                              },
                              child: Text("${String.fromCharCode(number.indx)}",
                                  style: TextStyle(fontSize: 75)))),
                    ),
                  ],
                ),
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: Container(
                        child: Container(
                            width: size.width,
                            height: size.height * 0.28,
                            child: CustomCanvas())))
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow[500],
        foregroundColor: Colors.black,
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            number.indx += 1;
            if (number.indx == 64) {
              number.indx = 48;
            }
          });
          tts.speak("${String.fromCharCode(number.indx)}");
        },
      ),
    );
  }
}
