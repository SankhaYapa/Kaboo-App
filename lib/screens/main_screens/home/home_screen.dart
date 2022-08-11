import 'package:flutter/material.dart';
import 'package:kaboo_app/compononets/custom_gradint_tile.dart';
import 'package:kaboo_app/compononets/custom_icon.dart';
import 'package:kaboo_app/compononets/custom_text.dart';

import 'package:kaboo_app/screens/main_screens/home/sub_screens/accomandation_screen.dart';
import 'package:kaboo_app/screens/main_screens/home/sub_screens/contactus_screen.dart';
import 'package:kaboo_app/screens/main_screens/home/sub_screens/create_journey_screen.dart';
import 'package:kaboo_app/screens/main_screens/home/sub_screens/explore_environment_screen.dart';
import 'package:kaboo_app/screens/main_screens/home/sub_screens/finds_job_screen.dart';
import 'package:kaboo_app/screens/main_screens/home/sub_screens/your_network_screen.dart';
import 'package:kaboo_app/utils/app_colors.dart';
import 'package:kaboo_app/utils/util_functions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 33, horizontal: 14),
        height: UtilFunctions.windoSize(context).height,
        width: UtilFunctions.windoSize(context).width,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: const [
              HeaderSection(),
              TileList(),
            ],
          ),
        ),
      ),
    );
  }
}

class TileList extends StatefulWidget {
  const TileList({
    Key? key,
  }) : super(key: key);

  @override
  State<TileList> createState() => _TileListState();
}

class _TileListState extends State<TileList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomGradientTile(
          onTap: () {
            UtilFunctions.navigator(context, CreateJourneyScreen());
          },
          name: "Create a new journey",
          icon: "newJourney.png",
          color1: kgradiantTileBlue1,
          color2: Colors.white,
        ),
        CustomGradientTile(
          onTap: () {
            UtilFunctions.navigator(context, ExploreEnvironmentScreen());
          },
          name: "Your Journey",
          icon: "yourJourney.png",
          color1: kgradiantTileBlue1,
          color2: Colors.white,
        ),
        CustomGradientTile(
          onTap: () {
            UtilFunctions.navigator(context, ExploreEnvironmentScreen());
          },
          name: "Explore your environment",
          icon: "environment.png",
          color1: kgradiantTileRed1,
          color2: Colors.white,
        ),
        CustomGradientTile(
          onTap: () {
            UtilFunctions.navigator(context, AccomandationScreen());
          },
          name: "Find an accommodation",
          icon: "accomodation.png",
          color1: kgradiantTileRed1,
          color2: Colors.white,
        ),
        CustomGradientTile(
          onTap: () {
            UtilFunctions.navigator(context, FindsJobScreen());
          },
          name: "Find Jobs",
          icon: "findJobs.png",
          color1: kgradiantTileBlue1,
          color2: Colors.white,
        ),
        CustomGradientTile(
          onTap: () {
            UtilFunctions.navigator(context, YourNetWorkScreen());
          },
          name: "Your Network",
          icon: "yourNetwork.png",
          color1: kgradiantTileRed1,
          color2: Colors.white,
        ),
        CustomGradientTile(
          onTap: () {
            UtilFunctions.navigator(context, ContactUsScreen());
          },
          name: "Contact Us",
          icon: "contactUs.png",
          color1: kgradiantTileRed1,
          color2: Colors.white,
        ),
      ],
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 51,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                CustomIcon(iconName: "profile.png"),
                SizedBox(width: 4),
                CustomText(
                  text: "Hello, Christian",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            const SizedBox(
              height: 60,
              width: 60,
              child: CustomIcon(iconName: "logo.png"),
            ),
          ],
        ),
        const SizedBox(width: 2),
        const CustomText(
          text: "Pick an action:",
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
