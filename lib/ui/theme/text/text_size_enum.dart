import 'package:flutter_screenutil/flutter_screenutil.dart';

enum TextSizeEnum {
  // headerLarge(size: 36),
  titleLarge(size: 20),
  titleMedium(size: 18),
  titleSmall(size: 16),
  content(size: 14),
  hint(size: 12);

  final double _size;

  const TextSizeEnum({required double size}) : _size = size;

  double get value => _size.sp;
}
