import 'package:eng_app_/Screens/LettersScreen/letters_screen.dart';
import 'package:eng_app_/Screens/NumbersScreen/number_screen.dart';

import 'package:flutter/material.dart';

import 'Screens/WordsScreen/words_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static dynamic screen = LettersScreen();
  getScreen() => screen;
  // ignore: non_constant_identifier_names
  int _cur_indx = 0;
  void changePage(int indx) {
    setState(() {
      _cur_indx = indx;
      if (indx == 1) {
        setState(() {
          screen = Center(child: NumberScreen());
        });
      } else if (indx == 2) {
        setState(() {
          screen = WordsScreen();
        });
      } else {
        setState(() {
          screen = LettersScreen();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getScreen(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.text_fields),
              backgroundColor: Colors.blue,
              label: "Letters"),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_numbered),
            backgroundColor: Colors.yellow[500],
            label: "Numbers",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.text_format),
              backgroundColor: Colors.lightGreen[500],
              label: "Words")
        ],
        onTap: changePage,
        currentIndex: _cur_indx,
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.shifting,
      ),
    );
  }
}
