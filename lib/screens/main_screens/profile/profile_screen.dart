import 'package:flutter/material.dart';
import 'package:kaboo_app/compononets/custom_text.dart';
import 'package:kaboo_app/providers/user_provider.dart';
import 'package:kaboo_app/screens/login_screens/change_password_screen.dart';
import 'package:kaboo_app/screens/main_screens/profile/aboutus_screen.dart';
import 'package:kaboo_app/screens/main_screens/profile/edit_profile_screen.dart';
import 'package:kaboo_app/utils/util_functions.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
            'Your Profile',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Consumer<UserProvider>(
          builder: (context, value, child) {
            return Container(
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Icon(Icons.camera_alt),
                    height: 159,
                    width: 159,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Consumer<UserProvider>(
                          builder: (context, value, child) {
                            return Column(
                              children: [
                                CustomText(
                                  text: 'xxx',
                                  //  text: "Hello,${value.userModel.fname}",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            );
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            UtilFunctions.navigator(
                                context, EditProfileScreen());
                          },
                          child: Row(children: [
                            Icon(Icons.person_outline),
                            SizedBox(
                              width: 20,
                            ),
                            CustomText(
                              text: 'Edit profile',
                              fontSize: 20,
                            )
                          ]),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            UtilFunctions.navigator(
                                context, ChangePasswordScreen());
                          },
                          child: Row(children: [
                            Icon(Icons.lock_outline),
                            SizedBox(
                              width: 20,
                            ),
                            CustomText(
                              text: 'Change Password',
                              fontSize: 20,
                            )
                          ]),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            UtilFunctions.navigator(context, AboutUsScreen());
                          },
                          child: Row(children: [
                            Icon(Icons.info_outline),
                            SizedBox(
                              width: 20,
                            ),
                            CustomText(
                              text: 'About Us',
                              fontSize: 20,
                            )
                          ]),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(children: [
                          Icon(Icons.logout),
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              value.logout(context);
                            },
                            child: CustomText(
                              text: 'Logout',
                              fontSize: 20,
                            ),
                          )
                        ])
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}
