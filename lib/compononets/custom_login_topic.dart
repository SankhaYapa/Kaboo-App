import 'package:flutter/material.dart';
import 'package:kaboo_app/utils/app_colors.dart';

class CustomLoginTopic extends StatelessWidget {
  const CustomLoginTopic({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 22,
        color: klightBlue,
      ),
    );
  }
}
