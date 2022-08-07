import 'package:flutter/material.dart';
import 'package:kaboo_app/compononets/custom_icon.dart';
import 'package:kaboo_app/compononets/custom_login_topic.dart';
import 'package:kaboo_app/compononets/custom_sign_buttom.dart';
import 'package:kaboo_app/compononets/custom_text_and_link.dart';
import 'package:kaboo_app/compononets/custom_text_field.dart';
import 'package:kaboo_app/screens/login_screens/sign_up_page.dart';
import 'package:kaboo_app/screens/main_screens/main_screen.dart';
import 'package:kaboo_app/utils/util_functions.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 33, horizontal: 13),
          height: UtilFunctions.windoSize(context).height,
          width: UtilFunctions.windoSize(context).width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 132,
                width: 132,
                child: CustomIcon(iconName: "logo.png"),
              ),
              const CustomLoginTopic(name: "Sign-In"),
              const SizedBox(height: 20),
              const MiddleSection(),
              const SizedBox(height: 18),
              CustomSignButton(
                name: "Sign-in",
                onclick: () {
                  UtilFunctions.pushRemoveNavigator(
                      context, const MainScreen());
                },
              ),
              const SizedBox(height: 25),
              CustomTextAndLink(
                onTab: () =>
                    UtilFunctions.navigator(context, const SignUpPage()),
                text: "Are you new here? ",
                link: "Sign up",
              )
            ],
          ),
        ),
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
          hint: "example@gmail.com",
          name: "Email",
        ),
        const SizedBox(height: 23),
        const CustomTextField(
          hint: "..........",
          name: "Password",
          isPassword: true,
        ),
        const SizedBox(height: 12),
        CustomTextAndLink(
          onTab: () {},
          text: "Forgotten password? ",
          link: "Reset now",
          align: MainAxisAlignment.start,
        ),
      ],
    );
  }
}
