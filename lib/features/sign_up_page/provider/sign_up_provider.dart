import 'package:flutter/widgets.dart';

class SignUpProvider extends ChangeNotifier {
  DateTime? _selectedDateTime;

  // 0, 1, 2, 3, 4;

  // ignore: prefer_final_fields
  int _passwordStage = 0;

  setDate(DateTime dateTime) {
    _selectedDateTime = dateTime;
    notifyListeners();
  }

  checkPasswordStage(String value) {}

  DateTime? get selectedDateTime => _selectedDateTime;

  int get passwordStage => _passwordStage;
}
