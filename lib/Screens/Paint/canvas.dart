import 'package:eng_app_/Screens/Paint/painter.dart';
import "package:flutter/material.dart";

class CustomCanvas extends StatefulWidget {
  @override
  _CustomCanvasState createState() => _CustomCanvasState();
}

class _CustomCanvasState extends State<CustomCanvas> {
  final List _offsets = <Offset>[];
void _clear()=>_offsets.clear();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            onPanDown: (details) {
              final renderBox = context.findRenderObject() as RenderBox;
              final localPosition =
                  renderBox.globalToLocal(details.globalPosition);
              print("localPosition:$localPosition");
              setState(() {
                _offsets.add(localPosition);
              });
            },
            onPanUpdate: (details) {
              setState(() {
                final renderBox = context.findRenderObject() as RenderBox;
                final localPosition =
                    renderBox.globalToLocal(details.globalPosition);
                print("localPosition:$localPosition");
                setState(() {
                  _offsets.add(localPosition);
                });
              });
            },
            onPanEnd: (details) {
              setState(() {
                _offsets.add(null);
              });
            },
            child: Center(
                child: CustomPaint(
                    painter: Painter(offsets: _offsets),
                    child: Column(
                      children: [

                        Stack(
                          children: [
                            Positioned(right:0,child:IconButton(icon:Icon(Icons.delete,), onPressed: _clear,iconSize:30)),
    Container(

                                width: MediaQuery.of(context).size.width,

                                height: MediaQuery.of(context).size.height*0.28),
],
                        ),
                      ],
                    ))),
          ),
        ],
      ),
    );
  }
}
