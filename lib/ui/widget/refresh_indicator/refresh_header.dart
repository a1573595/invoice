import 'package:flutter/material.dart';

abstract class RefreshHeader extends StatelessWidget {
  const RefreshHeader({
    super.key,
    required this.height,
  });

  final double height;
}
