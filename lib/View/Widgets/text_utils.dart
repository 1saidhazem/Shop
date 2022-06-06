import 'package:flutter/material.dart';

class TextUtils extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextDecoration textDecoration;
  final TextOverflow overflow;

  const TextUtils({required this.text,
    this.textAlign = TextAlign.start,
    this.fontSize = 20,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.white,
    this.textDecoration = TextDecoration.none,
    this.overflow = TextOverflow.visible,
    Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          decoration: textDecoration,
          overflow:overflow,
      ),
    );
  }
}
