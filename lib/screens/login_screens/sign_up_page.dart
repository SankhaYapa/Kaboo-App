import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kaboo_app/compononets/custom_icon.dart';
import 'package:kaboo_app/compononets/custom_login_topic.dart';
import 'package:kaboo_app/compononets/custom_sign_buttom.dart';
import 'package:kaboo_app/compononets/custom_text.dart';
import 'package:kaboo_app/compononets/custom_text_and_link.dart';
import 'package:kaboo_app/compononets/custom_text_field.dart';
import 'package:kaboo_app/providers/registration_provider.dart';
import 'package:kaboo_app/screens/login_screens/sign_in_page.dart';
import 'package:kaboo_app/screens/main_screens/main_screen.dart';
import 'package:kaboo_app/utils/app_colors.dart';
import 'package:kaboo_app/utils/util_functions.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<RegistrationProvider>(
        builder: (context, value, child) => Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 33, horizontal: 13),
          height: UtilFunctions.windoSize(context).height,
          width: UtilFunctions.windoSize(context).width,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 132,
                  width: 132,
                  child: CustomIcon(iconName: "logo.png"),
                ),
                const CustomLoginTopic(name: "Sign-Up"),
                const SizedBox(height: 20),
                MiddleSection(),
                const SizedBox(height: 34),
                (value.isLording == true)
                    ? SpinKitThreeInOut(
                        color: Colors.blue,
                        size: 50.0,
                      )
                    : CustomSignButton(
                        name: "Sign-up",
                        onclick: () {
                          value.srartRegister(context);
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
      ),
    );
  }
}

class Status extends StatefulWidget {
  const Status({
    Key? key,
    required this.name,
    this.width = 108,
    this.isClick = false,
    required this.function,
  }) : super(key: key);
  final String name;
  final double width;
  final bool isClick;
  final Function() function;

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.function();
      },
      child: Container(
        height: 48,
        width: widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: widget.isClick ? Colors.amber : Colors.white,
          border: Border.all(
            color: kgray,
          ),
        ),
        child: Center(
            child: CustomText(text: widget.name, align: TextAlign.center)),
      ),
    );
  }
}

class MiddleSection extends StatefulWidget {
  MiddleSection({
    Key? key,
  }) : super(key: key);

  @override
  State<MiddleSection> createState() => _MiddleSectionState();
}

class _MiddleSectionState extends State<MiddleSection> {
  bool student = false;
  bool internatinal = false;
  bool perment = false;
  bool getK = false;
  bool findC = false;
  bool findJ = false;
  bool findA = false;
  bool explore = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<RegistrationProvider>(
      builder: (context, value, child) => Column(
        children: [
          CustomTextField(
            controller: value.fNameController,
            hint: "",
            name: "First Name",
          ),
          const SizedBox(height: 8),
          CustomTextField(
            controller: value.lNameController,
            hint: "",
            name: "Last Name",
          ),
          const SizedBox(height: 8),
          CustomTextField(
            controller: value.emailController,
            hint: "example@gmail.com",
            name: "Email Address",
          ),
          const SizedBox(height: 8),
          CustomTextField(
            controller: value.passwordController,
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
            children: [
              Status(
                name: "Student",
                isClick: student,
                function: () {
                  value.setStatus("Student");
                  setState(() {
                    student = true;
                    internatinal = false;
                    perment = false;
                  });
                },
              ),
              Status(
                name: "International\nWorker",
                isClick: internatinal,
                function: () {
                  value.setStatus("International Worker");
                  setState(() {
                    student = false;
                    internatinal = true;
                    perment = false;
                  });
                },
              ),
              Status(
                name: "Permanent\n resident",
                isClick: perment,
                function: () {
                  value.setStatus("Permanent resident");
                  setState(() {
                    student = false;
                    internatinal = false;
                    perment = true;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 15),
          CustomTextField(
            controller: value.occupationController,
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
            children: [
              Status(
                name: "Get\nKnowledge",
                function: () {
                  value.setGoal("Get Knowledge");
                  setState(() {
                    getK = true;
                    findC = false;
                    findJ = false;
                    findA = false;
                    explore = false;
                  });
                },
                isClick: getK,
              ),
              Status(
                name: "Find\nCommunity",
                isClick: findC,
                function: () {
                  value.setGoal("Find Community");
                  setState(() {
                    getK = false;
                    findC = true;
                    findJ = false;
                    findA = false;
                    explore = false;
                  });
                },
              ),
              Status(
                name: "Find Jobs",
                function: () {
                  value.setGoal("Find Jobs");
                  setState(() {
                    getK = false;
                    findC = false;
                    findJ = true;
                    findA = false;
                    explore = false;
                  });
                },
                isClick: findJ,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Status(
                name: "Find\nAccomodation",
                width: 170,
                function: () {
                  value.setGoal("Find Accomodation");
                  setState(() {
                    getK = false;
                    findC = false;
                    findJ = false;
                    findA = true;
                    explore = false;
                  });
                },
                isClick: findA,
              ),
              Status(
                name: "Explore your\nDestination",
                width: 170,
                function: () {
                  value.setGoal("Explore your Destination");
                  setState(() {
                    getK = false;
                    findC = false;
                    findJ = false;
                    findA = false;
                    explore = true;
                  });
                },
                isClick: explore,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
