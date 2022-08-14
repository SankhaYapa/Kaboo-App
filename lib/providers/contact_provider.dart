import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ContactProvider extends ChangeNotifier {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  late String _country;

  TextEditingController get nameController => _nameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get messageController => _messageController;
  String get country => _country;

  void clear() {
    _nameController.clear();
    _emailController.clear();
    _messageController.clear();
    _country = "";
  }

  void setCountry(String c) {
    _country = c;
  }

  bool sendForm() {
    bool isSend = false;
    if (inputValidation()) {
      isSend = true;
      sendEmail();
      clear();
    }
    return isSend;
  }

  Future sendEmail() async {
    // final serviceId = 'service_rp38611';
    // final templateId = 'template_j3hpazi';
    // final userId = '8Oq0drGqIM-XZduJK';

    // final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    // final response = await http.post(url,
    //     headers: {
    //       'origin': 'http://localhost',
    //       'Content-Type': 'application/json',
    //     },
    //     body: json.encode({
    //       'service_id': serviceId,
    //       'template_id': templateId,
    //       'user_id': userId,
    //       'template_params': {
    //         "name": _nameController.text,
    //         "email": _emailController.text,
    //         "message": _messageController.text,
    //         "country": _country,
    //       }
    //     }));
    // return response.statusCode;
  }

  bool inputValidation() {
    var isValid = false;
    if (_emailController.text.isEmpty ||
        _nameController.text.isEmpty ||
        _messageController.text.isEmpty ||
        _country.isEmpty) {
      isValid = false;
    } else if (EmailValidator.validate(_emailController.text)) {
      isValid = false;
    } else {
      isValid = true;
    }
    return isValid;
  }
}
