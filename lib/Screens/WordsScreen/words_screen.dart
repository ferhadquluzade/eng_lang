import "package:flutter/material.dart";
import "package:flutter_tts/flutter_tts.dart";

// ignore: must_be_immutable
class WordsScreen extends StatefulWidget {
  int indx;
  WordsScreen({this.indx=0});
  @override
  _WordsScreenState createState() => _WordsScreenState();
}

class _WordsScreenState extends State<WordsScreen> {
  var word = WordsScreen(
    indx: 0,
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
    speak("Airplane");
  }

  static const List words_icons = [
    [Icons.airplanemode_active_outlined, "Airplane"],
    [Icons.directions_bike, "Bike"],
    [Icons.photo_camera, "Camera"],
    [Icons.edit, "Pencil"],
    [Icons.visibility, "Eye"],
    [Icons.fastfood, "Fast food"],
    [Icons.grass, "Grass"],
    [Icons.headset_mic, "Headset"],
    [Icons.icecream, "Ice cream"],
    [Icons.wb_incandescent_outlined, "Bulb"],
    [Icons.vpn_key_outlined, "Key"],
    [Icons.laptop, "Laptop"],
    [Icons.mouse_outlined, "Mouse"],
    [Icons.time_to_leave, "Car"],
    [Icons.mail, "Mail"],
    [Icons.palette, "Palette"],
    [Icons.radio, "Radio"],
    [Icons.cut, "Scissors"],
    [Icons.train, "Train"],
    [Icons.beach_access, "Umbrella"],
    [Icons.keyboard, "Keyboard"],
    [Icons.watch, "Watch"],
    [Icons.phone_android, "Phone"],
    [Icons.cloud_outlined, "Cloud"],
    [Icons.cake, "Cake"],
    [Icons.fingerprint, "Fingerprint"],
    [Icons.sensor_door, "Door"],
    [Icons.wb_sunny_outlined, "Sun"],
    [Icons.face, "Face"],
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.lightGreenAccent, Colors.blueAccent],
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
                              if (word.indx != 0) {
                                word.indx -= 1;
                              }
                              speak("${words_icons[word.indx][1]}");
                            });
                          },
                          child: Icon(words_icons[word.indx][0], size: 100))),
                ),
              ],
            ),
            SizedBox(height: 30),
            Container(
                child: TextButton(
                    onPressed: () => speak("${words_icons[word.indx][1]}"),
                    child: Text("${words_icons[word.indx][1]}",
                        style: TextStyle(
                            fontSize: size.width * 0.1,
                            fontWeight: FontWeight.w600))))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreenAccent,
        child: Icon(Icons.add, color: Colors.black),
        onPressed: () {
          setState(() {
            word.indx += 1;
            if (word.indx == words_icons.length) {
              word.indx = 0;
            }
          });
          speak("${words_icons[word.indx][1]}");
        },
      ),
    );
  }
}
