import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final class Gaps {
  Gaps._();

  static const Widget horizontalDivider = Divider();
  static const Widget verticalDivider = VerticalDivider();
  static const Widget empty = SizedBox.shrink();

  static final Widget w2 = SizedBox(width: 2.r);
  static final Widget w4 = SizedBox(width: 4.r);
  static final Widget w8 = SizedBox(width: 8.r);
  static final Widget w12 = SizedBox(width: 12.r);
  static final Widget w16 = SizedBox(width: 16.r);
  static final Widget w24 = SizedBox(width: 24.r);
  static final Widget w32 = SizedBox(width: 32.r);
  static final Widget w64 = SizedBox(width: 64.r);

  static final Widget h2 = SizedBox(height: 2.r);
  static final Widget h4 = SizedBox(height: 4.r);
  static final Widget h8 = SizedBox(height: 8.r);
  static final Widget h12 = SizedBox(height: 12.r);
  static final Widget h16 = SizedBox(height: 16.r);
  static final Widget h24 = SizedBox(height: 24.r);
  static final Widget h32 = SizedBox(height: 32.r);
  static final Widget h64 = SizedBox(height: 64.r);
}
