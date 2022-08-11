import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kaboo_app/compononets/custom_gradint_tile.dart';
import 'package:kaboo_app/compononets/custom_image.dart';

class ExploreEnvironmentScreen extends StatefulWidget {
  const ExploreEnvironmentScreen({Key? key}) : super(key: key);

  @override
  State<ExploreEnvironmentScreen> createState() =>
      _ExploreEnvironmentScreenState();
}

class _ExploreEnvironmentScreenState extends State<ExploreEnvironmentScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Explore your environment',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  width: size.width, child: CustomImage(name: "explore.png")),
              CustomGradientTile(
                  name: 'Explore your environment',
                  icon: 'resturent.png',
                  color1: Color.fromARGB(255, 168, 231, 244),
                  color2: Color.fromARGB(255, 128, 225, 245),
                  onTap: () {}),
              CustomGradientTile(
                  name: 'Groceries Stores',
                  icon: 'groceries.png',
                  color1: Color.fromARGB(255, 168, 231, 244),
                  color2: Color.fromARGB(255, 128, 225, 245),
                  onTap: () {}),
              CustomGradientTile(
                  name: 'Coffee shop',
                  icon: 'coffee.png',
                  color1: Color.fromARGB(255, 168, 231, 244),
                  color2: Color.fromARGB(255, 128, 225, 245),
                  onTap: () {}),
              CustomGradientTile(
                  name: 'Hospital',
                  icon: 'hospital.png',
                  color1: Color.fromARGB(255, 168, 231, 244),
                  color2: Color.fromARGB(255, 128, 225, 245),
                  onTap: () {}),
              CustomGradientTile(
                  name: 'Clubs',
                  icon: 'club.png',
                  color1: Color.fromARGB(255, 168, 231, 244),
                  color2: Color.fromARGB(255, 128, 225, 245),
                  onTap: () {}),
              CustomGradientTile(
                  name: 'Government office',
                  icon: 'government.png',
                  color1: Color.fromARGB(255, 168, 231, 244),
                  color2: Color.fromARGB(255, 128, 225, 245),
                  onTap: () {}),
            ],
          ),
        ));
  }
}
