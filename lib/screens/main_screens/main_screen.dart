import 'package:flutter/material.dart';
import 'package:kaboo_app/compononets/custom_svg.dart';
import 'package:kaboo_app/compononets/custom_text.dart';
import 'package:kaboo_app/screens/main_screens/calender/calender_screen.dart';
import 'package:kaboo_app/screens/main_screens/home/home_screen.dart';
import 'package:kaboo_app/screens/main_screens/map/map_screem.dart';
import 'package:kaboo_app/screens/main_screens/profile/profile_screen.dart';
import 'package:kaboo_app/utils/app_colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const CalenderScreen(),
    const MapScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens.elementAt(_currentIndex),
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
                  isSelected: _currentIndex == 0,
                  ontap: () {
                    setState(() {
                      _currentIndex = 0;
                    });
                  },
                ),
                BottomNavTile(
                  text: "Calender",
                  icon: "calender.svg",
                  isSelected: _currentIndex == 1,
                  ontap: () {
                    setState(() {
                      _currentIndex = 1;
                    });
                  },
                ),
                BottomNavTile(
                  text: "Map",
                  icon: "map.svg",
                  isSelected: _currentIndex == 2,
                  ontap: () {
                    setState(() {
                      _currentIndex = 2;
                    });
                  },
                ),
                BottomNavTile(
                  text: "Profile",
                  icon: "profile.svg",
                  isSelected: _currentIndex == 3,
                  ontap: () {
                    setState(() {
                      _currentIndex = 3;
                    });
                  },
                ),
              ],
            ),
          ],
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
