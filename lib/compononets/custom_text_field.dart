import 'package:flutter/material.dart';
import 'package:kaboo_app/utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.hint,
    required this.name,
    this.isPassword = false,
    Key? key,
  }) : super(key: key);
  final String hint;
  final String name;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      controller: TextEditingController(),
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        labelText: name,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
        hintText: hint,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kgray),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kgray),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
