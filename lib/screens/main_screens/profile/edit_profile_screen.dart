import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kaboo_app/compononets/custom_text.dart';
import 'package:kaboo_app/compononets/custom_text_field.dart';

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
        centerTitle: true,
        title: Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        width: size.width,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Icon(Icons.camera_alt),
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
                  CustomText(text: 'Full Name'),
                  SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                    text: 'Name',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomText(text: 'Email'),
                  SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                    text: 'example@abc.com',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomText(text: 'Your Status'),
                  SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                    text: 'Student',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomText(text: 'Occupation'),
                  SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                    text: 'Freelacer',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextField(
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
