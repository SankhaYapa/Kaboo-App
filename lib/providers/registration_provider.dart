import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:kaboo_app/compononets/custom_dialog.dart';
import 'package:kaboo_app/controllers/auth_controller.dart';
import 'package:kaboo_app/providers/user_provider.dart';
import 'package:kaboo_app/screens/main_screens/main_screen.dart';
import 'package:kaboo_app/utils/util_functions.dart';
import 'package:logger/logger.dart';

class RegistrationProvider extends ChangeNotifier {
  bool _passwordVisible = true;
  bool _isLoging = false;

  final _fNameController = TextEditingController();
  final _lNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _occupationController = TextEditingController();
  String _status = "";
  String _goal = "";

//get password hidden
  bool get isPasswordVisible => _passwordVisible;

//get is lording
  bool get isLording => _isLoging;

//gatters
  TextEditingController get fNameController => _fNameController;
  TextEditingController get lNameController => _lNameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get occupationController => _occupationController;
  String get status => _status;
  String get goal => _goal;

  void setStatus(String status) {
    _status = status;
  }

  void setGoal(String goal) {
    _goal = goal;
  }

  //change passwordvisibale
  void changePasswordVistibale() {
    _passwordVisible = !_passwordVisible;
    notifyListeners();
  }

  //validater
  bool inputValidation() {
    var isValid = false;
    if (_emailController.text.isEmpty ||
        _lNameController.text.isEmpty ||
        _fNameController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _occupationController.text.isEmpty) {
      isValid = false;
    } else if (!EmailValidator.validate(_emailController.text)) {
      isValid = false;
    } else if (_status == "" || _goal == "") {
      isValid = false;
    } else {
      isValid = true;
    }
    return isValid;
  }

  Future<void> srartRegister(BuildContext context) async {
    try {
      setLording(true);

      if (inputValidation()) {
        await AuthController()
            .registrationUser(
          context,
          _emailController.text,
          _passwordController.text,
          _fNameController.text,
          _lNameController.text,
          _occupationController.text,
          _status,
          _goal,
        )
            .whenComplete(() {
          // UserProvider().fetchSingleUser(
          //   AuthController().userCredential2.user!.uid.toString(),
          // );

          CustomAwesomDialog().dialogBox(
              context,
              "Success...!",
              "Congratulations...! User Account created Now you can Login.",
              DialogType.SUCCES);

          Future.delayed(Duration(seconds: 5), () {
            cleardata();

            UtilFunctions.pushRemoveNavigator(context, MainScreen());
          });
        });
      } else {
        CustomAwesomDialog().dialogBox(
          context,
          "Error...!",
          "Please check your input details.",
          DialogType.ERROR,
        );
      }

      setLording(false);
    } catch (e) {
      setLording(false);
      Logger().e(e);
    }
  }

  //change lordingState
  void setLording([bool val = false]) {
    _isLoging = val;
    notifyListeners();
  }

  void cleardata() {
    _emailController.clear();
    _passwordController.clear();
    _fNameController.clear();
    _lNameController.clear();
    _occupationController.clear();
    _status = '';
    _goal = '';
  }
}
