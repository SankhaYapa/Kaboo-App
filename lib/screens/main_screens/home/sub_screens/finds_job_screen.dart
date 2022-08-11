import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kaboo_app/compononets/custom_gradint_tile.dart';
import 'package:kaboo_app/compononets/custom_icon.dart';
import 'package:kaboo_app/compononets/custom_image.dart';
import 'package:kaboo_app/compononets/custom_text.dart';

class FindsJobScreen extends StatefulWidget {
  const FindsJobScreen({Key? key}) : super(key: key);

  @override
  State<FindsJobScreen> createState() => _FindsJobScreenState();
}

class _FindsJobScreenState extends State<FindsJobScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Find Jobs',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(children: [
          CustomImage(
            name: 'findjobs.png',
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(255, 213, 209, 255),
                            Color.fromARGB(255, 129, 133, 252)
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
                    child: CustomText(
                      text: "Explore Jobs",
                      fontSize: 18,
                    ),
                  )
                ],
              ))
        ]));
  }
}
