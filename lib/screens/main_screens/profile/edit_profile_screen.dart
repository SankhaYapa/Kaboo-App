import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kaboo_app/compononets/custom_sign_buttom.dart';
import 'package:kaboo_app/compononets/custom_text.dart';
import 'package:kaboo_app/compononets/custom_text_field.dart';
import 'package:kaboo_app/providers/user_provider.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
          'Edit Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(child: Consumer<UserProvider>(
        builder: (context, value, child) {
          return Container(
            width: size.width,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: value.getImg.path != ''
                      ? Image.file(
                          value.getImg,
                        )
                      : IconButton(
                          onPressed: () {
                            value.selectImage();
                          },
                          icon: Icon(Icons.camera_alt)),
                  height: 159,
                  width: 159,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: 'First Name'),
                      SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                        controller: value.fNameController,
                        text: value.userModel.fname,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomText(text: 'Last Name'),
                      SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                        controller: value.lNameController,
                        text: value.userModel.lname,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomText(text: 'Email'),
                      SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                        text: value.userModel.email,
                        controller: value.emailController,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomText(text: 'Your Status'),
                      SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                        text: value.userModel.status,
                        controller: value.statusController,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomText(text: 'Occupation'),
                      SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                        controller: value.occupationController,
                        text: value.userModel.occupation,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomSignButton(
                          onclick: () {
                            Provider.of<UserProvider>(context, listen: false)
                                .logout(context);
                          },
                          name: 'Confirm')
                    ],
                  ),
                )
              ],
            ),
          );
        },
      )),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.text,
    required this.controller,
  }) : super(key: key);
  final String text;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.edit),
        hintText: text,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
