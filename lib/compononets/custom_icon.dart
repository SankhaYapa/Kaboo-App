import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  CustomIcon({
    Key? key,
    required this.iconName,
  }) : super(key: key);

  String iconName;
  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/icons/$iconName");
  }
}
