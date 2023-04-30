import 'dart:ui';

import 'package:flutter/material.dart';

class SelectionModalDecoration {
  late TextStyle titleStyle;
  late Color btnBackGroundColor;
  late  Color btnTextColor;
  double btnRadios;
  String btnText;

  SelectionModalDecoration(
      {TextStyle? titleStyle,
      Color? btnBackGroundColor,
      Color? btnTextColor,
        this.btnText='Back',
      this.btnRadios = 15}) {
    this.titleStyle = titleStyle ??
        const TextStyle(color: Colors.black, fontWeight: FontWeight.bold);
    this.btnBackGroundColor = (btnBackGroundColor ?? Colors.yellow[700])!;
    this.btnTextColor = btnTextColor ?? Colors.black;
  }
}
