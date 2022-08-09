import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    this.tColor = Colors.black,
    this.fontWeight = FontWeight.w400,
    this.align = TextAlign.left,
    this.fontSize = 14,
    required this.text,
  }) : super(key: key);
  final String text;
  final Color tColor;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign align;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: tColor,
      ),
    );
  }
}
