import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kaboo_app/compononets/custom_gradint_tile.dart';
import 'package:kaboo_app/compononets/custom_icon.dart';
import 'package:kaboo_app/compononets/custom_image.dart';
import 'package:kaboo_app/compononets/custom_text.dart';
import 'package:url_launcher/url_launcher.dart';

class l2Flankers extends StatefulWidget {
  const l2Flankers({Key? key}) : super(key: key);

  @override
  State<l2Flankers> createState() => _l2FlankersState();
}

class _l2FlankersState extends State<l2Flankers> {
  final Uri _url1 = Uri.parse('https://www.luckymobile.ca/');
  Future<void> _launchUrl1() async {
    if (!await launchUrl(_url1)) {
      throw 'Could not launch $_url1';
    }
  }

  final Uri _url2 = Uri.parse('https://www.publicmobile.ca/en');
  Future<void> _launchUrl2() async {
    if (!await launchUrl(_url2)) {
      throw 'Could not launch $_url2';
    }
  }

  final Uri _url3 = Uri.parse('https://www.chatrwireless.com/');
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
            '2nd Level Flankers',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            CustomImage(
              name: 'findjobs.png',
            ),
            CustomProvince(
              size: size,
              text: 'Lucky Mobile',
              onTap: _launchUrl1,
            ),
            CustomProvince(
              size: size,
              text: 'Public Mobile',
              onTap: _launchUrl2,
            ),
            CustomProvince(
              size: size,
              text: 'Chatr Mobile',
              onTap: _launchUrl3,
            ),
          ]),
        ));
  }
}

class CustomProvince extends StatelessWidget {
  const CustomProvince(
      {Key? key, required this.size, required this.text, required this.onTap})
      : super(key: key);

  final Size size;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
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
                        Color.fromARGB(255, 239, 239, 239)
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
                  text: text,
                  fontSize: 18,
                ),
              )
            ],
          )),
    );
  }
}
