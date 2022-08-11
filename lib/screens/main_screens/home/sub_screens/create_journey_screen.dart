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
                ),
                SizedBox(
                  width: 10,
                ),
                CustomCards(
                  name: 'Bank Account',
                  gif: 'money.gif',
                ),
                SizedBox(
                  width: 10,
                ),
                CustomCards(
                  name: 'Local Cell Plan',
                  gif: 'cell.gif',
                ),
                SizedBox(
                  width: 10,
                ),
                CustomCards(
                  name: 'Government Health\n Insurance Card',
                  gif: 'trust.gif',
                ),
                SizedBox(
                  width: 10,
                ),
                CustomCards(
                  name: 'Get your PR Card',
                  gif: 'debit.gif',
                ),
                SizedBox(
                  width: 10,
                ),
                CustomCards(
                  name: 'Driver License or\n Transport card',
                  gif: 'license.gif',
                ),
                SizedBox(
                  width: 10,
                ),
                CustomCards(
                  name: 'Map of the City',
                  gif: 'map.gif',
                ),
                SizedBox(
                  width: 10,
                ),
                CustomCards(
                  name: 'Search for\n Accommodation',
                  gif: 'home.gif',
                ),
                SizedBox(
                  width: 10,
                ),
                CustomCards(
                  name: 'Community Groups',
                  gif: 'community.gif',
                ),
                SizedBox(
                  width: 10,
                ),
                CustomCards(
                  name: 'Find a Bucket List ',
                  gif: 'checklist.gif',
                ),
                SizedBox(
                  width: 10,
                ),
                CustomCards(
                  name: 'Know 911 for\n Emergency',
                  gif: 'ring.gif',
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
  const CustomCards({Key? key, required this.name, required this.gif})
      : super(key: key);
  final String name;
  final String gif;
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      CustomImage(name: 'rect.png'),
      Column(
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
