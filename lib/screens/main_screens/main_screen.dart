import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:kaboo_app/compononets/custom_svg.dart';
import 'package:kaboo_app/compononets/custom_text.dart';
import 'package:kaboo_app/screens/main_screens/calender/calender_screen.dart';
import 'package:kaboo_app/screens/main_screens/home/home_screen.dart';
import 'package:kaboo_app/screens/main_screens/map/map_screem.dart';
import 'package:kaboo_app/screens/main_screens/profile/profile_screen.dart';
import 'package:kaboo_app/utils/app_colors.dart';

// ignore: must_be_immutable
class MainScreen extends StatefulWidget {
  MainScreen({
    Key? key,
    this.currentIndex = 0,
  }) : super(key: key);

  int currentIndex;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //int _currentIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const CalenderScreen(),
    const MapScreen(),
    const ProfileScreen(),
  ];
  Future<bool> initBackButton() async {
    return await showDialog(
          context: context,
          builder: (context) => ElasticIn(
              child: AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
              10,
            )),
            title: const CustomText(
              text: "ExitApp",
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            content: Builder(
              builder: (context) {
                return const SizedBox(
                  height: 70,
                  width: 200,
                  child: CustomText(text: "Do you really want to exit an app?"),
                );
              },
            ),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                onPressed: () => Navigator.of(context).pop(true),
                child: const CustomText(
                  text: "Yes",
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                child: const CustomText(
                  text: "No",
                ),
              ),
            ],
          )),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: initBackButton,
      child: Scaffold(
        body: _screens.elementAt(widget.currentIndex),
        bottomNavigationBar: Container(
          height: 70,
          color: Colors.white,
          child: Column(
            children: [
              const Divider(
                height: 1,
                color: kgrayDark2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BottomNavTile(
                    text: "Home",
                    icon: "Home.svg",
                    isSelected: widget.currentIndex == 0,
                    ontap: () {
                      setState(() {
                        widget.currentIndex = 0;
                      });
                    },
                  ),
                  BottomNavTile(
                    text: "Calender",
                    icon: "calender.svg",
                    isSelected: widget.currentIndex == 1,
                    ontap: () {
                      setState(() {
                        widget.currentIndex = 1;
                      });
                    },
                  ),
                  BottomNavTile(
                    text: "Map",
                    icon: "map.svg",
                    isSelected: widget.currentIndex == 2,
                    ontap: () {
                      setState(() {
                        widget.currentIndex = 2;
                      });
                    },
                  ),
                  BottomNavTile(
                    text: "Profile",
                    icon: "profile.svg",
                    isSelected: widget.currentIndex == 3,
                    ontap: () {
                      setState(() {
                        widget.currentIndex = 3;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomNavTile extends StatelessWidget {
  const BottomNavTile({
    Key? key,
    required this.icon,
    required this.isSelected,
    required this.ontap,
    this.padding = 10,
    required this.text,
  }) : super(key: key);

  final String icon;
  final bool isSelected;
  final Function() ontap;
  final double padding;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: ontap,
        child: Container(
          padding: EdgeInsets.all(padding),
          width: 75,
          height: 65,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSVG(
                name: icon,
                color: isSelected ? kgrayDark2 : kgrayDark1,
              ),
              const SizedBox(
                height: 3,
              ),
              CustomText(
                text: text,
                fontSize: 11,
                tColor: isSelected ? kgrayDark2 : kgrayDark1,
              ),
            ],
          ),
        ));
  }
}
