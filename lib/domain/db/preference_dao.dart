import 'package:flutter/material.dart';

abstract interface class PreferenceDao {
  int? getThemeModeIndex();

  void setThemeModeIndex(ThemeMode themeMode);

  String? getLanguageCode();

  void setLanguageCode(String language);
}
