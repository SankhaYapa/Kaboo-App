import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kaboo_app/compononets/custom_icon.dart';
import 'package:kaboo_app/compononets/custom_image.dart';
import 'package:kaboo_app/compononets/custom_text.dart';
<<<<<<< HEAD
import 'package:kaboo_app/screens/example.dart';
=======
>>>>>>> 076f9fa2d7e023372764c4fa7b1430d8e6e20c3e
import 'package:kaboo_app/utils/util_functions.dart';
import 'package:url_launcher/url_launcher.dart';

class AccomandationScreen extends StatefulWidget {
  const AccomandationScreen({Key? key}) : super(key: key);

  @override
  State<AccomandationScreen> createState() => _AccomandationScreenState();
}

class _AccomandationScreenState extends State<AccomandationScreen> {
  final Uri _url1 = Uri.parse('https://www.airbnb.ca/');
  Future<void> _launchUrl1() async {
    if (!await launchUrl(_url1)) {
      throw 'Could not launch $_url1';
    }
  }

  final Uri _url2 =
      Uri.parse('https://www.kijiji.ca/b-for-rent/canada/c30349001l0');
  Future<void> _launchUrl2() async {
    if (!await launchUrl(_url2)) {
      throw 'Could not launch $_url2';
    }
  }

  final Uri _url3 = Uri.parse(
      'https://www.facebook.com/marketplace/category/propertyrentals');
  Future<void> _launchUrl3() async {
    if (!await launchUrl(_url3)) {
      throw 'Could not launch $_url3';
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          centerTitle: true,
          title: Text(
            'Find an accommodation',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(children: [
          CustomImage(
            name: 'accoman.png',
          ),
          AccomandationList(
              size: size,
              icon: "airbnb.png",
              text: 'Open Airbnb ',
<<<<<<< HEAD
              onTap: _launchUrl1),
          AccomandationList(
              size: size,
              icon: "kijiji.png",
              text: 'Explore on Kijiji ',
              onTap: _launchUrl2),
          AccomandationList(
              size: size,
              icon: "facebook.png",
              text: 'Explore on Facebook \n marketplace ',
              onTap: _launchUrl3),
        ]));
=======
              onTap: () {
                final url =
                    'https://www.airbnb.ca/KIJIJI : https://www.kijiji.ca/b-for-rent/canada/c30349001l0';
              },
            ),
            AccomandationList(
              size: size,
              icon: "kijiji.png",
              text: 'Explore on Kijiji ',
              onTap: () {
                final url =
                    'https://www.airbnb.ca/KIJIJI : https://www.kijiji.ca/b-for-rent/canada/c30349001l0';
              },
            ),
            AccomandationList(
              size: size,
              icon: "facebook.png",
              text: 'Explore on Facebook \n marketplace ',
              onTap: () {
                final url =
                    'https://www.airbnb.ca/KIJIJI : https://www.kijiji.ca/b-for-rent/canada/c30349001l0';
              },
            )
          ],
        ));
>>>>>>> 076f9fa2d7e023372764c4fa7b1430d8e6e20c3e
  }
}

class AccomandationList extends StatelessWidget {
<<<<<<< HEAD
  AccomandationList(
=======
  const AccomandationList(
>>>>>>> 076f9fa2d7e023372764c4fa7b1430d8e6e20c3e
      {Key? key,
      required this.size,
      required this.icon,
      required this.text,
<<<<<<< HEAD
      // required this.url
=======
>>>>>>> 076f9fa2d7e023372764c4fa7b1430d8e6e20c3e
      required this.onTap})
      : super(key: key);

  final Size size;
  final String icon;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
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
          ])),
    );
  }
}
