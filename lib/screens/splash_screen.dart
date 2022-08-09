import 'package:flutter/material.dart';
import 'package:kaboo_app/compononets/custom_icon.dart';
import 'package:kaboo_app/screens/login_screens/sign_in_page.dart';
import 'package:kaboo_app/utils/app_colors.dart';
import 'package:kaboo_app/utils/util_functions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      UtilFunctions.pushRemoveNavigator(context, const SignInPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              kgradiantBlue,
              kgradiantyello,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: CustomIcon(iconName: "logo.png"),
        ),
      ),
    );
  }
}
