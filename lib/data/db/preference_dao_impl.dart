import 'package:flutter/material.dart';
import 'package:invoice/data/model/preference.dart';
import 'package:invoice/domain/db/preference_dao.dart';
import 'package:objectbox/objectbox.dart';

class PreferenceDaoImpl implements PreferenceDao {
  final Box<Preference> _box;

  const PreferenceDaoImpl(Box<Preference> box) : _box = box;

  @override
  int? getThemeModeIndex() => _box.getAll().firstOrNull?.themeModeIndex;

  @override
  void setThemeModeIndex(ThemeMode themeMode) {
    final preference = _box.getAll().firstOrNull ?? Preference.byDefault();

    _box.put(preference.copyWith(themeModeIndex: themeMode.index));
  }

  @override
  String? getLanguageCode() => _box.getAll().firstOrNull?.languageCode;

  @override
  void setLanguageCode(String language) {
    final preference = _box.getAll().firstOrNull ?? Preference.byDefault();

    _box.put(preference.copyWith(languageCode: language));
  }
}
