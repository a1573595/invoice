import 'package:flutter/material.dart';

enum ColorEnum {
  primaryColor(value: Color(0xFFF04E23)),
  secondaryColor(value: Color(0xFFF26944)),
  errorColor(value: Color(0xFFCF304A)),
  surfaceLightColor(value: Color(0xFFFCFCFC)),
  surfaceDarkColor(value: Color(0xFF1A2C38)),
  primaryTextLightColor(value: Color(0xFF1E2329)),
  primaryTextDarkColor(value: Color(0xFFFFFFFF));

  final Color value;

  const ColorEnum({required this.value});
}
