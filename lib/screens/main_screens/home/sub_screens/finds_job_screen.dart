import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kaboo_app/compononets/custom_gradint_tile.dart';
import 'package:kaboo_app/compononets/custom_icon.dart';
import 'package:kaboo_app/compononets/custom_image.dart';
import 'package:kaboo_app/compononets/custom_text.dart';
import 'package:url_launcher/url_launcher.dart';

class FindsJobScreen extends StatefulWidget {
  const FindsJobScreen({Key? key}) : super(key: key);

  @override
  State<FindsJobScreen> createState() => _FindsJobScreenState();
}

class _FindsJobScreenState extends State<FindsJobScreen> {
  final Uri _url1 = Uri.parse(
      'https://www.linkedin.com/jobs/search/?currentJobId=3223797550&geoId=&keywords=&location=canada');
  Future<void> _launchUrl1() async {
    if (!await launchUrl(_url1)) {
      throw 'Could not launch $_url1';
    }
  }

  final Uri _url2 = Uri.parse('https://ca.indeed.com/');
  Future<void> _launchUrl2() async {
    if (!await launchUrl(_url2)) {
      throw 'Could not launch $_url2';
    }
  }

  final Uri _url3 = Uri.parse('https://www.careerbeacon.com/');
  Future<void> _launchUrl3() async {
    if (!await launchUrl(_url3)) {
      throw 'Could not launch $_url3';
    }
  }

  final Uri _url4 = Uri.parse('https://www.jobbank.gc.ca/home');
  Future<void> _launchUrl4() async {
    if (!await launchUrl(_url4)) {
      throw 'Could not launch $_url4';
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
            'Find Jobs',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(children: [
          CustomImage(
            name: 'findjobs.png',
          ),
          CustomJobs(
            size: size,
            text: 'LinkedIn',
            onTap: _launchUrl1,
          ),
          CustomJobs(
            size: size,
            text: 'Indeed',
            onTap: _launchUrl2,
          ),
          CustomJobs(
            size: size,
            text: 'Career Beacon',
            onTap: _launchUrl3,
          ),
          CustomJobs(
            size: size,
            text: 'Jobs Bank',
            onTap: _launchUrl4,
          ),
        ]));
  }
}

class CustomJobs extends StatelessWidget {
  const CustomJobs(
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
                  text: text,
                  fontSize: 18,
                ),
              )
            ],
          )),
    );
  }
}
