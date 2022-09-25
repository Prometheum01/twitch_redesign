import 'package:flutter/cupertino.dart';

mixin PasswordVisibilityMixin<T extends StatefulWidget> on State<T> {
  bool isVisible = false;

  changeVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }
}
