import 'package:flutter/material.dart';
import 'package:kaboo_app/compononets/custom_icon.dart';
import 'package:kaboo_app/compononets/custom_text.dart';

class CustomGradientTile extends StatelessWidget {
  const CustomGradientTile({
    Key? key,
    required this.name,
    required this.icon,
    required this.color1,
    required this.color2,
    this.start = Alignment.topCenter,
    this.end = Alignment.bottomCenter,
  }) : super(key: key);
  final String name;
  final String icon;
  final Color color1;
  final Color color2;
  final AlignmentGeometry start;
  final AlignmentGeometry end;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84,
      width: double.infinity,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              elevation: 6,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 58,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: LinearGradient(
                    colors: [
                      color1,
                      color2,
                    ],
                    begin: start,
                    end: end,
                  ),
                ),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      text: name,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    )),
              ),
            ),
          ),
          Align(
              alignment: Alignment.topRight, child: CustomIcon(iconName: icon)),
        ],
      ),
    );
  }
}
