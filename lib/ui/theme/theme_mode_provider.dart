import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invoice/common/util/extension_util.dart';
import 'package:invoice/data/db/object_box_helper.dart';

final themeModeProvider = ChangeNotifierProvider((ref) => ThemeModeNotifier());

class ThemeModeNotifier with ChangeNotifier {
  ThemeMode _value = ThemeMode.values[ObjectBoxHelper.preferenceDao.getThemeModeIndex() ??
      WidgetsBinding.instance.platformDispatcher.platformBrightness.toThemeMode().index];

  ThemeMode get value => _value;

  bool get isDark => _value != ThemeMode.dark;

  void toggleThemeMode(ThemeMode themeMode) {
    if (themeMode == _value) return;

    ObjectBoxHelper.preferenceDao.setThemeModeIndex(themeMode);
    _value = themeMode;
    notifyListeners();
  }
}
