import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:invoice/ui/widget/refresh_indicator/refresh_indicator.dart' as ri;
import 'package:invoice/ui/widget/refresh_indicator/three_bounce_refresh_indicator.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(name: 'ThreeBounceRefreshIndicator', type: ri.RefreshIndicator)
Widget threeBounceRefreshIndicator(BuildContext context) {
  /// Flutter Web: RefreshIndicator not working anymore
  /// https://stackoverflow.com/questions/75904448/flutter-web-refreshindicator-not-working-anymore
  return ScrollConfiguration(
    behavior: ScrollConfiguration.of(context).copyWith(
      physics: const BouncingScrollPhysics(),
      dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse, PointerDeviceKind.trackpad},
    ),
    child: ThreeBounceRefreshIndicator(
      onRefresh: () => Future.delayed(const Duration(seconds: 3)),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width: double.infinity,
            child: Center(
              child: Text("Pull to refresh"),
            ),
          ),
        ],
      ),
    ),
  );
}
