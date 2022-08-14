import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAwesomDialog {
  Future<dynamic> dialogBox(
    BuildContext context,
    final _title,
    final _desc,
    DialogType _type,
  ) async {
    return AwesomeDialog(
      context: context,
      dialogType: _type,
      animType: AnimType.BOTTOMSLIDE,
      title: _title,
      desc: _desc,
      btnOkColor: Colors.blue,
      buttonsTextStyle: GoogleFonts.poppins(
          color: Colors.red, fontSize: 15, fontWeight: FontWeight.bold),
      //btnCancelOnPress: () {},

      btnOkOnPress: () {},
    ).show();
  }
}
