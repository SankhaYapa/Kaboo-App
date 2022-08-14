import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kaboo_app/model/user_model.dart';
import 'package:kaboo_app/screens/login_screens/sign_in_page.dart';
import 'package:kaboo_app/screens/main_screens/home/home_screen.dart';
import 'package:kaboo_app/utils/util_functions.dart';
import 'package:logger/logger.dart';

import '../controllers/db_controller.dart';
import '../screens/main_screens/main_screen.dart';

class UserProvider extends ChangeNotifier {
  final DatabaseController _databaseController = DatabaseController();

  final _fNameController = TextEditingController();
  final _lNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _occupationController = TextEditingController();
  final _statusController = TextEditingController();
  //gatters
  TextEditingController get fNameController => _fNameController;
  TextEditingController get lNameController => _lNameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get occupationController => _occupationController;
  TextEditingController get statusController => _statusController;

  late UserModel _userModel;
  UserModel get userModel => _userModel;

  final ImagePicker _picker = ImagePicker();

  //image file
  File _image = File("");

  //get image
  File get getImg => _image;

  String userName = "User";

  //initialize user function
  Future<void> initializerUser(BuildContext context) async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        Logger().w('User is currently signed out');
        UtilFunctions.navigator(context, SignInPage());
      } else {
        Logger().w('User is signed in');
        UtilFunctions.navigator(context, MainScreen());

        await fetchSingleUser(user.uid);
        userName = _userModel.fname;
        Logger().i(userName);
      }
    });
  }

  Future<void> fetchSingleUser(String id) async {
    _userModel = (await _databaseController.getUserData(id))!;
    notifyListeners();
  }

//select image
  Future<void> selectImage() async {
    try {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        notifyListeners();
      } else {
        Logger().i("No image selected");
      }
    } catch (e) {
      Logger().e(e);
    }
  }

  //sign out method
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    UtilFunctions.navigator(context, SignInPage());
  }

  Future<void> updateUser(BuildContext context) async {
    try {
      _databaseController.updateUser(
          _userModel.uid,
          _fNameController.text,
          _lNameController.text,
          _emailController.text,
          _occupationController.text,
          _statusController.text,
          _image);
      notifyListeners();
    } catch (e) {}
  }
}
