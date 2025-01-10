import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:invoice/ui/theme/app_theme.dart';
import 'package:invoice/ui/widget/refresh_indicator/refresh_header.dart';
import 'package:invoice/ui/widget/refresh_indicator/refresh_indicator.dart';

class ThreeBounceRefreshIndicator extends StatelessWidget {
  const ThreeBounceRefreshIndicator({
    super.key,
    required this.onRefresh,
    required this.child,
  });

  final AsyncCallback onRefresh;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      header: const ThreeBounceHeader(),
      child: child,
    );
  }
}

class ThreeBounceHeader extends HookWidget implements RefreshHeader {
  const ThreeBounceHeader({
    super.key,
    this.color,
    this.duration = const Duration(milliseconds: 1500),
    this.size = 24,
  });

  @override
  final double height = 100.0;

  final Color? color;
  final Duration duration;
  final double size;

  @override
  Widget build(BuildContext context) {
    final colors = useMemoized(() {
      final color = this.color ?? context.appColorTheme.primary;

      return [
        color,
        color.withOpacity(0.7),
        color.withOpacity(0.4),
      ];
    });

    return SpinKitThreeBounce(
      size: size,
      duration: duration,
      itemBuilder: (context, index) => DecoratedBox(
        decoration: BoxDecoration(
          color: colors[index % 3],
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
