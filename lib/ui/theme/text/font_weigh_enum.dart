import 'package:flutter/material.dart';

enum FontWeighEnum {
  extraBold(value: FontWeight.w800),
  bold(value: FontWeight.w700),
  medium(value: FontWeight.w500),
  normal(value: FontWeight.w400);

  final FontWeight value;

  const FontWeighEnum({required this.value});
}
