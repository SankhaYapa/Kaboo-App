import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kaboo_app/compononets/custom_icon.dart';
import 'package:kaboo_app/compononets/custom_image.dart';
import 'package:kaboo_app/compononets/custom_text.dart';

class AccomandationScreen extends StatefulWidget {
  const AccomandationScreen({Key? key}) : super(key: key);

  @override
  State<AccomandationScreen> createState() => _AccomandationScreenState();
}

class _AccomandationScreenState extends State<AccomandationScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Find an accommodation',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            CustomImage(
              name: 'accoman.png',
            ),
            AccomandationList(
              size: size,
              icon: "airbnb.png",
              text: 'Open Airbnb ',
            ),
            AccomandationList(
              size: size,
              icon: "kijiji.png",
              text: 'Explore on Kijiji ',
            ),
            AccomandationList(
              size: size,
              icon: "facebook.png",
              text: 'Explore on Facebook \n marketplace ',
            )
          ],
        ));
  }
}

class AccomandationList extends StatelessWidget {
  const AccomandationList({
    Key? key,
    required this.size,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final Size size;
  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Stack(alignment: Alignment.center, children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 248, 242, 247),
                    Color.fromARGB(255, 252, 211, 250)
                  ]),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  spreadRadius: 0.2,
                  blurRadius: 2,
                  offset: Offset(0, 2),
                )
              ],
            ),
            width: size.width,
            height: 58,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: text,
                  fontSize: 18,
                ),
                CustomIcon(iconName: icon)
              ],
            ),
          )
        ]));
  }
}
