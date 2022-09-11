import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kaboo_app/compononets/custom_gradint_tile.dart';
import 'package:kaboo_app/compononets/custom_icon.dart';
import 'package:kaboo_app/compononets/custom_image.dart';
import 'package:kaboo_app/compononets/custom_text.dart';
import 'package:kaboo_app/screens/main_screens/home/sub_screens/journey_sub_screen/cell_phone_category.dart/l1flankers.dart';
import 'package:kaboo_app/screens/main_screens/home/sub_screens/journey_sub_screen/cell_phone_category.dart/l2flankers.dart';
import 'package:kaboo_app/screens/main_screens/home/sub_screens/journey_sub_screen/cell_phone_category.dart/majors.dart';
import 'package:kaboo_app/utils/util_functions.dart';
import 'package:url_launcher/url_launcher.dart';

class CellPhonePlan extends StatefulWidget {
  const CellPhonePlan({Key? key}) : super(key: key);

  @override
  State<CellPhonePlan> createState() => _CellPhonePlanState();
}

class _CellPhonePlanState extends State<CellPhonePlan> {
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
            'Local Cellphone Category',
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
              text: 'Majors',
              onTap: () {
                UtilFunctions.navigator(context, Majors());
              },
            ),
            CustomProvince(
              size: size,
              text: '1st Level Flankers',
              onTap: () {
                UtilFunctions.navigator(context, l1Flankers());
              },
            ),
            CustomProvince(
              size: size,
              text: '2nd Level Flankers',
              onTap: () {
                UtilFunctions.navigator(context, l2Flankers());
              },
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
