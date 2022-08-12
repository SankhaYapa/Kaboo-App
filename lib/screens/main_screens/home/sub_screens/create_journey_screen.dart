import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kaboo_app/compononets/custom_icon.dart';
import 'package:kaboo_app/compononets/custom_image.dart';
import 'package:kaboo_app/compononets/custom_text.dart';

class CreateJourneyScreen extends StatefulWidget {
  const CreateJourneyScreen({Key? key}) : super(key: key);

  @override
  State<CreateJourneyScreen> createState() => _CreateJourneyScreenState();
}

class _CreateJourneyScreenState extends State<CreateJourneyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Create your journey ',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          CustomImage(name: 'jouney.png'),
          SizedBox(
            height: 30,
          ),
          CustomText(text: 'Select your requirements'),
          SizedBox(
            height: 30,
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                CustomCards(
                  name: 'Get Your SIN',
                  gif: 'pin.gif',
                  color1: Colors.white,
                  color2: Colors.blue,
                ),
                SizedBox(
                  width: 10,
                ),
                CustomCards(
                  name: 'Bank Account',
                  gif: 'money.gif',
                  color1: Colors.white,
                  color2: Color.fromARGB(255, 21, 52, 255),
                ),
                SizedBox(
                  width: 10,
                ),
                CustomCards(
                    name: 'Local Cell Plan',
                    gif: 'cell.gif',
                    color1: Colors.white,
                    color2: Color.fromARGB(255, 90, 230, 248)),
                SizedBox(
                  width: 10,
                ),
                CustomCards(
                  name: 'Government Health\n Insurance Card',
                  gif: 'trust.gif',
                  color1: Colors.white,
                  color2: Color.fromARGB(255, 250, 89, 177),
                ),
                SizedBox(
                  width: 10,
                ),
                CustomCards(
                    name: 'Get your PR Card',
                    gif: 'debit.gif',
                    color1: Colors.white,
                    color2: Colors.blue),
                SizedBox(
                  width: 10,
                ),
                CustomCards(
                  name: 'Driver License or\n Transport card',
                  gif: 'license.gif',
                  color1: Colors.white,
                  color2: Color.fromARGB(255, 211, 46, 248),
                ),
                SizedBox(
                  width: 10,
                ),
                CustomCards(
                  name: 'Map of the City',
                  gif: 'map.gif',
                  color1: Colors.white,
                  color2: Color.fromARGB(255, 245, 42, 218),
                ),
                SizedBox(
                  width: 10,
                ),
                CustomCards(
                  name: 'Search for\n Accommodation',
                  gif: 'home.gif',
                  color1: Colors.white,
                  color2: Color.fromARGB(255, 78, 122, 245),
                ),
                SizedBox(
                  width: 10,
                ),
                CustomCards(
                  name: 'Community Groups',
                  gif: 'community.gif',
                  color1: Colors.white,
                  color2: Color.fromARGB(255, 244, 252, 33),
                ),
                SizedBox(
                  width: 10,
                ),
                CustomCards(
                  name: 'Find a Bucket List ',
                  gif: 'checklist.gif',
                  color1: Colors.white,
                  color2: Color.fromARGB(255, 4, 227, 67),
                ),
                SizedBox(
                  width: 10,
                ),
                CustomCards(
                  name: 'Know 911 for\n Emergency',
                  gif: 'ring.gif',
                  color1: Colors.white,
                  color2: Color.fromARGB(255, 26, 240, 172),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomCards extends StatelessWidget {
  const CustomCards({
    Key? key,
    required this.name,
    required this.gif,
    required this.color1,
    required this.color2,
  }) : super(key: key);
  final String name;
  final String gif;
  final Color color1;
  final Color color2;
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        elevation: 6,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 231,
          width: 287,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            gradient: LinearGradient(
              colors: [
                color1,
                color2,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // child: Align(
          //     alignment: Alignment.centerLeft,
          //     child: CustomText(
          //       text: name,
          //       fontSize: 15,
          //       fontWeight: FontWeight.w400,
          //     )),
        ),
      ),
      //CustomImage(name: 'rect.png'),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(height: 95, width: 95, child: CustomIcon(iconName: gif)),
          CustomText(
            text: name,
            fontSize: 24,
            align: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            width: 153,
            height: 29,
            child: Text('select'),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
            ),
          )
        ],
      )
    ]);
  }
}
