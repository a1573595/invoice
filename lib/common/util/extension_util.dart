import 'package:flutter/material.dart';

extension BrightnessExtension on Brightness {
  ThemeMode toThemeMode() => this == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
}

extension ListExtension<T> on List<T> {
  T? tryGet(int index) => index >= 0 && index < length ? this[index] : null;
}
