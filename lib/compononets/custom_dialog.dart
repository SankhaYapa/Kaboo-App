import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAwesomDialog {
  Future<dynamic> dialogBox(
      BuildContext context, final title, final desc, DialogType type) async {
    return AwesomeDialog(
      context: context,
      dialogType: type,
      animType: AnimType.BOTTOMSLIDE,
      title: title,
      desc: desc,
      btnOkColor: Colors.blue,
      buttonsTextStyle: GoogleFonts.poppins(
          color: Colors.red, fontSize: 15, fontWeight: FontWeight.bold),
      //btnCancelOnPress: () {},

      btnOkOnPress: () {},
    ).show();
  }
}
