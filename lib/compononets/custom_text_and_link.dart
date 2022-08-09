import 'package:flutter/material.dart';
import 'package:kaboo_app/compononets/custom_text.dart';
import 'package:kaboo_app/utils/app_colors.dart';

class CustomTextAndLink extends StatelessWidget {
  const CustomTextAndLink({
    Key? key,
    required this.link,
    required this.onTab,
    required this.text,
    this.align = MainAxisAlignment.center,
  }) : super(key: key);
  final String text;
  final String link;
  final MainAxisAlignment align;
  final Function onTab;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: align,
      children: [
        CustomText(
          text: text,
          fontWeight: FontWeight.w500,
        ),
        GestureDetector(
          onTap: () {
            onTab();
          },
          child: CustomText(
            text: link,
            tColor: klightBlue,
          ),
        ),
      ],
    );
  }
}
