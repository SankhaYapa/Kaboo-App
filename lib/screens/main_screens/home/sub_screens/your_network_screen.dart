import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kaboo_app/compononets/custom_icon.dart';
import 'package:kaboo_app/compononets/custom_image.dart';
import 'package:kaboo_app/compononets/custom_text.dart';

class YourNetWorkScreen extends StatefulWidget {
  const YourNetWorkScreen({Key? key}) : super(key: key);

  @override
  State<YourNetWorkScreen> createState() => _YourNetWorkScreenState();
}

class _YourNetWorkScreenState extends State<YourNetWorkScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Your Network',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            CustomImage(
              name: 'yournetwork.png',
            ),
            YourNetWorkList(
              size: size,
              icon: "bookmark.png",
              text: 'Bookmarks',
            ),
            YourNetWorkList(
              size: size,
              icon: "chat.png",
              text: 'Chat',
            ),
            YourNetWorkList(
              size: size,
              icon: "call.png",
              text: 'Call',
            ),
            YourNetWorkList(
              size: size,
              icon: "map.png",
              text: 'Your Map',
            )
          ],
        ));
  }
}

class YourNetWorkList extends StatelessWidget {
  const YourNetWorkList({
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
            // color: Colors.black12,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 241, 214, 234),
                    Color.fromARGB(255, 237, 123, 221)
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
