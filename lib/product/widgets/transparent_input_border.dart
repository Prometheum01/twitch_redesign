import 'package:flutter/material.dart';

class TransparentInputBorder extends InputDecoration {
  const TransparentInputBorder()
      : super(
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        );
}
