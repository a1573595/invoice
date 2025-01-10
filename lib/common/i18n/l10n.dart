import 'dart:ui';

import 'package:invoice/common/gen/strings.g.dart';
import 'package:invoice/data/db/object_box_helper.dart';
import 'package:slang/overrides.dart';

final class L10n {
  const L10n._();

  static late Translations _tr;

  static Translations get tr => _tr;

  static Future<AppLocale> init() => LocaleSettings.setLocaleRaw(
      ObjectBoxHelper.preferenceDao.getLanguageCode() ?? AppLocaleUtils.findDeviceLocale().languageCode);

  static Future<void> overrideTranslation({
    required String languageCode,
    required String content,
  }) =>
      LocaleSettings.overrideTranslations(
        locale: AppLocaleUtils.parse(languageCode),
        fileType: FileType.json,
        content: content,
      );

  static Future<void> setLanguage(Locale local) => LocaleSettings.setLocaleRaw(local.languageCode)
      .then((value) => ObjectBoxHelper.preferenceDao.setLanguageCode(local.languageCode));

  static void setTranslation(Translations translation) => _tr = translation;
}
