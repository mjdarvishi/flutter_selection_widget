import 'dart:ui';

import 'package:flutter/material.dart';

class SelectionBoxDecoration {
late   TextStyle titleStyle;
  late TextStyle hintStyle;

  SelectionBoxDecoration({TextStyle? titleStyle, TextStyle? hintStyle}) {
    this.titleStyle = titleStyle ??
        const TextStyle(color: Colors.black, fontWeight: FontWeight.bold);
    this.hintStyle = hintStyle ??
        const TextStyle(color: Colors.grey, fontWeight: FontWeight.w300);
  }
}
