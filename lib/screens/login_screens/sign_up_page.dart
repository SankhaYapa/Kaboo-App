import 'package:flutter/material.dart';
import 'package:kaboo_app/compononets/custom_icon.dart';
import 'package:kaboo_app/compononets/custom_login_topic.dart';
import 'package:kaboo_app/compononets/custom_sign_buttom.dart';
import 'package:kaboo_app/compononets/custom_text.dart';
import 'package:kaboo_app/compononets/custom_text_and_link.dart';
import 'package:kaboo_app/compononets/custom_text_field.dart';
import 'package:kaboo_app/screens/login_screens/sign_in_page.dart';
import 'package:kaboo_app/screens/main_screens/main_screen.dart';
import 'package:kaboo_app/utils/app_colors.dart';
import 'package:kaboo_app/utils/util_functions.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 33, horizontal: 13),
        height: UtilFunctions.windoSize(context).height,
        width: UtilFunctions.windoSize(context).width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 132,
                width: 132,
                child: CustomIcon(iconName: "logo.png"),
              ),
              const CustomLoginTopic(name: "Sign-Up"),
              const SizedBox(height: 20),
              const MiddleSection(),
              const SizedBox(height: 34),
              CustomSignButton(
                  name: "Sign-up",
                  onclick: () {
                    UtilFunctions.pushRemoveNavigator(
                        context, const MainScreen());
                  }),
              const SizedBox(height: 25),
              CustomTextAndLink(
                onTab: () =>
                    UtilFunctions.navigator(context, const SignInPage()),
                text: "Already have an accout?  ",
                link: "Sign in",
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Status extends StatelessWidget {
  const Status({
    Key? key,
    required this.name,
    this.width = 108,
  }) : super(key: key);
  final String name;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 48,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          border: Border.all(
            color: kgray,
          ),
        ),
        child: Center(child: CustomText(text: name, align: TextAlign.center)),
      ),
    );
  }
}

class MiddleSection extends StatelessWidget {
  const MiddleSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextField(
          hint: "",
          name: "First Name",
        ),
        const SizedBox(height: 8),
        const CustomTextField(
          hint: "",
          name: "Last Name",
        ),
        const SizedBox(height: 8),
        const CustomTextField(
          hint: "example@gmail.com",
          name: "Email Address",
        ),
        const SizedBox(height: 8),
        const CustomTextField(
          hint: "..........",
          name: "Password",
          isPassword: true,
        ),
        const SizedBox(height: 8),
        const CustomText(
          text: "What Status describe you the most ? :",
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Status(name: "Student"),
            Status(name: "International\nWorker"),
            Status(name: "Permanent\n resident"),
          ],
        ),
        const SizedBox(height: 15),
        const CustomTextField(
          hint: "",
          name: "Occupation",
        ),
        const SizedBox(height: 12),
        const CustomText(
          text: "What’s your goal ? :",
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Status(name: "Get\nKnowledge"),
            Status(name: "Find\nCommunity"),
            Status(name: "Find Jobs"),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Status(
              name: "Find\nAccomodation",
              width: 170,
            ),
            Status(
              name: "Explore your\nDestination",
              width: 170,
            ),
          ],
        ),
      ],
    );
  }
}
