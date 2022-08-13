import 'package:flutter/cupertino.dart';

class ContactProvider extends ChangeNotifier {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  late String _country;

  TextEditingController get nameController => _nameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get messageController => _messageController;
  String get country => _country;

  void setCountry(String c) {
    _country = c;
  }

  void sendForm() {}
}
