// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:kaboo_app/compononets/custom_text.dart';
import 'package:kaboo_app/utils/app_colors.dart';

class CustomSignButton extends StatelessWidget {
  const CustomSignButton({
    Key? key,
    required this.onclick,
    required this.name,
  }) : super(key: key);
  final String name;
  final Function() onclick;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onclick(),
      child: CustomText(
        text: name,
        fontSize: 18,
        tColor: Colors.white,
      ),
      style: ElevatedButton.styleFrom(
        primary: klightBlue,
        fixedSize: const Size(double.maxFinite, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}
