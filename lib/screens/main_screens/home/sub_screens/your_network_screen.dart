import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:kaboo_app/compononets/custom_icon.dart';
import 'package:kaboo_app/compononets/custom_image.dart';
import 'package:kaboo_app/compononets/custom_text.dart';
import 'package:kaboo_app/screens/main_screens/home/chat_screen.dart';
import 'package:kaboo_app/utils/gloable_data.dart';
import 'package:kaboo_app/utils/util_functions.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

class YourNetWorkScreen extends StatefulWidget {
  const YourNetWorkScreen({Key? key}) : super(key: key);

  @override
  State<YourNetWorkScreen> createState() => _YourNetWorkScreenState();
}

class _YourNetWorkScreenState extends State<YourNetWorkScreen> {
  String phoneNumber = '9470191877';
  final Uri _url =
      Uri.parse('https://wa.me/9470191877?text=How Can I Help You');
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
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
              onTap: () {},
              size: size,
              icon: "bookmark.png",
              text: 'Bookmarks',
            ),
            YourNetWorkList(
              onTap: _launchUrl,
              size: size,
              icon: "chat.png",
              text: 'Chat',
            ),
            YourNetWorkList(
              onTap: () async {
                launch("tel://21213123123");
              },
              size: size,
              icon: "call.png",
              text: 'Call',
            ),
            YourNetWorkList(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlacePicker(
                      apiKey: GlobalData.API_KEY,
                      onPlacePicked: (result) {
                        print(result.formattedAddress);
                        Navigator.of(context).pop();
                      },
                      initialPosition: LatLng(7.8731, 80.7718),
                      useCurrentLocation: true,
                      resizeToAvoidBottomInset:
                          false, // remove this line, if map offsets are wrong
                    ),
                  ),
                );
              },
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
    required this.onTap,
  }) : super(key: key);

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
                  // IconButton(onPressed: , icon: icon)
                  CustomIcon(iconName: icon)
                ],
              ),
            )
          ])),
    );
  }
}
