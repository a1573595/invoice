import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invoice/ui/theme/color/app_color_theme.dart';
import 'package:invoice/ui/theme/color/color_enum.dart';
import 'package:invoice/ui/theme/text/app_text_theme.dart';
import 'package:invoice/ui/theme/text/font_family_enum.dart';

final class AppTheme {
  static final _lightAppColorsTheme = AppColorTheme(
    primary: ColorEnum.primaryColor.value,
    onPrimary: ColorEnum.primaryTextLightColor.value,
    secondary: ColorEnum.secondaryColor.value,
    onSecondary: ColorEnum.primaryTextLightColor.value,
    error: ColorEnum.errorColor.value,
    onError: ColorEnum.primaryTextLightColor.value,
    surface: ColorEnum.surfaceLightColor.value,
    onSurface: ColorEnum.primaryTextLightColor.value,
  );

  static final _darkAppColorsTheme = AppColorTheme(
    primary: ColorEnum.primaryColor.value,
    onPrimary: ColorEnum.primaryTextDarkColor.value,
    secondary: ColorEnum.secondaryColor.value,
    onSecondary: ColorEnum.primaryTextDarkColor.value,
    error: ColorEnum.errorColor.value,
    onError: ColorEnum.primaryTextDarkColor.value,
    surface: ColorEnum.surfaceDarkColor.value,
    onSurface: ColorEnum.primaryTextDarkColor.value,
  );

  final ThemeData lightTheme;
  final ThemeData darkTheme;

  const AppTheme._({
    required this.lightTheme,
    required this.darkTheme,
  });

  factory AppTheme.byDefault() {
    final lightTextStylesTheme = AppTextTheme.byDefault(
      color: ColorEnum.primaryTextLightColor.value,
      fontFamily: FontFamilyEnum.robot,
    );

    final dartTextStylesTheme = AppTextTheme.byDefault(
      color: ColorEnum.primaryTextDarkColor.value,
      fontFamily: FontFamilyEnum.robot,
    );

    return AppTheme._(
      lightTheme: ThemeData.light().copyWith(
        colorScheme: _lightAppColorsTheme.toColorScheme(Brightness.light),
        cupertinoOverrideTheme: CupertinoThemeData(
          primaryColor: ColorEnum.primaryColor.value,
          primaryContrastingColor: ColorEnum.surfaceLightColor.value,
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyMedium: lightTextStylesTheme.content,
            ),
        extensions: [
          _lightAppColorsTheme,
          lightTextStylesTheme,
        ],
        // scaffoldBackgroundColor:
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: _darkAppColorsTheme.toColorScheme(Brightness.dark),
        cupertinoOverrideTheme: CupertinoThemeData(
          primaryColor: ColorEnum.primaryColor.value,
          primaryContrastingColor: ColorEnum.surfaceDarkColor.value,
        ),
        textTheme: ThemeData.dark().textTheme.copyWith(
              bodyMedium: dartTextStylesTheme.content,
            ),
        extensions: [
          _darkAppColorsTheme,
          dartTextStylesTheme,
        ],
        // scaffoldBackgroundColor:
      ),
    );
  }
}

extension AppThemeExtension on BuildContext {
  AppColorTheme get appColorTheme => Theme.of(this).extension<AppColorTheme>()!;

  AppTextTheme get appTextTheme => Theme.of(this).extension<AppTextTheme>()!;
}
