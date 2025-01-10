import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final class WidgetStyle {
  const WidgetStyle._();

  static const double _cardPadding = 12;
  static const double _screenPadding = 16;
  static const double _tablePadding = 4;

  static const double _bottomSheetRadius = 24;
  static const double _cardRadius = 12;
  static const double _circleRadius = 256;

  static const double pickerItemExtent = 32;
  static const double pickerSqueeze = 1.2;
  static const double pickerMagnification = 1.3;

  static final EdgeInsets cardPadding = EdgeInsets.all(_cardPadding.r);
  static final EdgeInsets screenPadding = EdgeInsets.all(_screenPadding.r);
  static final EdgeInsets screenHorizontalPadding = EdgeInsets.symmetric(horizontal: _screenPadding.r);
  static final EdgeInsets screenVerticalPadding = EdgeInsets.symmetric(vertical: _screenPadding.r);
  static final EdgeInsets tableVerticalPadding = EdgeInsets.symmetric(vertical: _tablePadding.r);

  static const BorderRadius bottomSheetRadius = BorderRadius.vertical(top: Radius.circular(_bottomSheetRadius));
  static const BorderRadius cardRadius = BorderRadius.all(Radius.circular(_cardRadius));
  static const BorderRadius circleRadius = BorderRadius.all(Radius.circular(_circleRadius));
}
