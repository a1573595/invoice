import 'package:flutter/material.dart';
import 'package:invoice/ui/theme/text/font_family_enum.dart';
import 'package:invoice/ui/theme/text/font_weigh_enum.dart';
import 'package:invoice/ui/theme/text/text_size_enum.dart';

class AppTextTheme extends ThemeExtension<AppTextTheme> {
  const AppTextTheme({
    required this.titleLarge,
    required this.titleMedium,
    required this.titleSmall,
    required this.content,
    required this.hint,
  });

  AppTextTheme.byDefault({
    Color? color,
    FontFamilyEnum? fontFamily,
  })  : titleLarge = TextStyle(
          color: color,
          fontFamily: fontFamily?.value,
          fontSize: TextSizeEnum.titleLarge.value,
          fontWeight: FontWeighEnum.normal.value,
        ),
        titleMedium = TextStyle(
          color: color,
          fontFamily: fontFamily?.value,
          fontSize: TextSizeEnum.titleMedium.value,
          fontWeight: FontWeighEnum.normal.value,
        ),
        titleSmall = TextStyle(
          color: color,
          fontFamily: fontFamily?.value,
          fontSize: TextSizeEnum.titleSmall.value,
          fontWeight: FontWeighEnum.normal.value,
        ),
        content = TextStyle(
          color: color,
          fontFamily: fontFamily?.value,
          fontSize: TextSizeEnum.content.value,
          fontWeight: FontWeighEnum.normal.value,
        ),
        hint = TextStyle(
          color: color,
          fontFamily: fontFamily?.value,
          fontSize: TextSizeEnum.hint.value,
          fontWeight: FontWeighEnum.normal.value,
        );

  final TextStyle titleLarge;
  final TextStyle titleMedium;
  final TextStyle titleSmall;
  final TextStyle content;
  final TextStyle hint;

  @override
  ThemeExtension<AppTextTheme> copyWith({
    TextStyle? titleLarge,
    TextStyle? titleMedium,
    TextStyle? titleSmall,
    TextStyle? content,
    TextStyle? hint,
  }) {
    return AppTextTheme(
      titleLarge: titleLarge ?? this.titleLarge,
      titleMedium: titleMedium ?? this.titleMedium,
      titleSmall: titleSmall ?? this.titleSmall,
      content: content ?? this.content,
      hint: hint ?? this.hint,
    );
  }

  @override
  ThemeExtension<AppTextTheme> lerp(
    covariant ThemeExtension<AppTextTheme>? other,
    double t,
  ) {
    if (other is! AppTextTheme) {
      return this;
    }

    return AppTextTheme(
      titleLarge: TextStyle.lerp(titleLarge, other.titleLarge, t)!,
      titleMedium: TextStyle.lerp(titleMedium, other.titleMedium, t)!,
      titleSmall: TextStyle.lerp(titleSmall, other.titleSmall, t)!,
      content: TextStyle.lerp(content, other.content, t)!,
      hint: TextStyle.lerp(hint, other.hint, t)!,
    );
  }
}
