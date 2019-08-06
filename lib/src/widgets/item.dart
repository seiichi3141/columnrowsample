import 'package:flutter_web/material.dart';

class Item extends StatelessWidget {
  final MaterialColor color;
  final Size size;
  final String text;
  final TextStyle textStyle;

  Item({this.color, this.size, this.text, this.textStyle});

  Widget build(context) {
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        color: color[400],
        border: Border.all(
          width: 2.0,
          color: color[900],
        ),
      ),
      child: Center(child: Text(text, style: textStyle)),
    );
  }
}
