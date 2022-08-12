import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kaboo_app/compononets/custom_dialog.dart';
import 'package:kaboo_app/controllers/auth_controller.dart';
import 'package:logger/logger.dart';

class LoginProvider extends ChangeNotifier {
  //firebase auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //password hidden
  bool _passwordVisible = true;

  //email controller
  final _email = TextEditingController();

  //password controller
  final _password = TextEditingController();

  //loding state
  bool _isLoging = false;

//get password hidden
  bool get isOasswordVisible => _passwordVisible;

//get is lording
  bool get isLording => _isLoging;

//get email controller
  TextEditingController get emailController => _email;

//get password controller
  TextEditingController get passwordController => _password;

//change passwordvisibale
  void changePasswordVistibale() {
    _passwordVisible = !_passwordVisible;
    notifyListeners();
  }

  //validater
  bool inputValidation() {
    var isValid = false;
    if (_email.text.isEmpty || _password.text.isEmpty) {
      isValid = false;
    } else if (!EmailValidator.validate(_email.text)) {
      isValid = false;
    } else {
      isValid = true;
    }
    return isValid;
  }

//loginFunction
  Future<void> startLogin(BuildContext context) async {
    try {
      setLording(true);
      if (inputValidation()) {
        await AuthController().login(context, _email.text, _password.text);
      } else {
        CustomAwesomDialog().dialogBox(context, "Error...!",
            'Please check your input Details..!', DialogType.ERROR);
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
}
