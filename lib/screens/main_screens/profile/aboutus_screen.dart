import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kaboo_app/compononets/custom_image.dart';
import 'package:kaboo_app/compononets/custom_text.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'About Us',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(width: size.width, child: CustomImage(name: 'about.jpg')),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomText(
                text:
                    "We are passionate about our community.We provide you with everything you need for a successful integration into your new region.\n\nFor you, we are always innovating more and we are dedicated to build a strong community of peoples who share their experiences to help newcomers .\n\nDownload our app and dive into your new personalized journey.Kaabo, you will never feel alone",
                overflow: TextOverflow.clip,
                align: TextAlign.center,
                fontSize: 17,
              ),
            ),
            CustomText(
              text: 'Meet Our Team',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            CustomTeamMembers(
              size: size,
              text2: 'CEO',
              text: 'Cristian Affian',
            ),
            CustomTeamMembers(
              size: size,
              text2: 'COO',
              text: 'Anthony Yameogo',
            ),
            CustomTeamMembers(
              size: size,
              text2: 'CTO',
              text: 'to fill(Technologie)',
            ),
            CustomTeamMembers(
              size: size,
              text2: 'CFO',
              text: 'to fill(Finacial)',
            ),
            CustomTeamMembers(
              size: size,
              text2: '',
              text: 'Head Product Development',
            )
          ],
        ),
      ),
    );
  }
}

class CustomTeamMembers extends StatelessWidget {
  const CustomTeamMembers({
    Key? key,
    required this.size,
    required this.text,
    required this.text2,
  }) : super(key: key);

  final Size size;
  final String text;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: size.width,
            height: 250,
            decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 66, 66, 68)),
                //   color: Colors.amberAccent,
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          Column(
            children: [
              Container(
                height: 159,
                width: 159,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(100))),
              ),
              CustomText(
                text: text,
                fontSize: 18,
              ),
              CustomText(
                text: text2,
                fontSize: 20,
              )
            ],
          ),
        ],
      ),
    );
  }
}
