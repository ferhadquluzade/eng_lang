import 'package:eng_lang/Screens/LettersScreen/letters_screen.dart';
import 'package:eng_lang/Screens/NumbersScreen/number_screen.dart';

import 'package:flutter/material.dart';

import 'Screens/WordsScreen/words_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static dynamic screen = LettersScreen();
  getScreen() => screen;
  // ignore: non_constant_identifier_names
  int _cur_index = 0;
  void changePage(int index) {
    setState(() {
      _cur_index = index;
      if (index == 1) {
        setState(() {
          screen = Center(child: NumberScreen());
        });
      } else if (index == 2) {
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
          const BottomNavigationBarItem(
              icon: Icon(Icons.text_fields),
              backgroundColor: Colors.blue,
              label: "Letters"),
          BottomNavigationBarItem(
            icon: const Icon(Icons.format_list_numbered),
            backgroundColor: Colors.yellow[500],
            label: "Numbers",
          ),
          BottomNavigationBarItem(
              icon: const Icon(Icons.text_format),
              backgroundColor: Colors.lightGreen[500],
              label: "Words")
        ],
        onTap: changePage,
        currentIndex: _cur_index,
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.shifting,
      ),
    );
  }
}
