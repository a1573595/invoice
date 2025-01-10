import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:invoice/ui/widget/refresh_indicator/refresh_header.dart';

class RefreshIndicator extends StatefulWidget {
  const RefreshIndicator({
    super.key,
    required this.onRefresh,
    required this.header,
    required this.child,
  });

  final AsyncCallback onRefresh;
  final RefreshHeader header;
  final Widget child;

  @override
  State<RefreshIndicator> createState() => _RefreshIndicatorState();
}

class _RefreshIndicatorState extends State<RefreshIndicator> {
  final controller = IndicatorController();

  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
      controller: controller,
      offsetToArmed: widget.header.height,
      onRefresh: widget.onRefresh,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        physics: AlwaysScrollableScrollPhysics(
          parent: ClampingWithOverscrollPhysics(state: controller),
        ),
        child: widget.child,
      ),
      builder: (
        BuildContext context,
        Widget child,
        IndicatorController controller,
      ) {
        return Stack(
          children: [
            AnimatedBuilder(
              animation: controller,
              builder: (BuildContext context, Widget? _) {
                return SizedBox(
                  height: controller.value * widget.header.height,
                  child: widget.header,
                );
              },
            ),
            AnimatedBuilder(
              builder: (context, _) {
                return Transform.translate(
                  offset: Offset(0.0, controller.value * widget.header.height),
                  child: child,
                );
              },
              animation: controller,
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
