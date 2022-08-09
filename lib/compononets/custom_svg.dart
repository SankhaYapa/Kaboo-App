import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSVG extends StatelessWidget {
  const CustomSVG({Key? key, required this.name, required this.color})
      : super(key: key);
  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "assets/icons/$name",
      color: color,
    );
  }
}
