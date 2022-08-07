import 'package:flutter/material.dart';

class UtilFunctions {
  //navigation function
  static void navigator(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }

  //go back function
  static void goBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  //get window size
  static Size windoSize(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return size;
  }

//navigation function push and remove
  static void pushRemoveNavigator(BuildContext context, Widget widget) {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => widget), (route) => false);
  }
}
