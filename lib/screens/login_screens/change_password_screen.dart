import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kaboo_app/compononets/custom_text.dart';
import 'package:kaboo_app/compononets/custom_text_field.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Change Password',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              hint: 'Current Password',
              name: 'Current Password',
              controller: TextEditingController(),
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              hint: 'New Password',
              name: 'New Password',
              controller: TextEditingController(),
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              hint: 'Re-Enter New Password',
              name: 'Re-Enter New Password',
              controller: TextEditingController(),
            ),
          ],
        ),
      ),
    );
  }
}
