import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    Key? key,
    required this.iconName,
  }) : super(key: key);

  final String iconName;
  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/icons/$iconName");
  }
}
