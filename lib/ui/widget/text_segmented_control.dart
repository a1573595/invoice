import 'package:flutter/cupertino.dart';
import 'package:invoice/ui/theme/app_theme.dart';
import 'package:invoice/ui/theme/widget_style.dart';

class TextSegmentedControl<T extends Object> extends StatelessWidget {
  const TextSegmentedControl({
    super.key,
    required this.children,
    required this.groupValue,
    this.onChanged,
  });

  final Map<T, String> children;
  final T groupValue;
  final ValueChanged<T>? onChanged;

  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl<T>(
      children: {for (final child in children.entries) child.key: _TextSegmentedItem(child.value)},
      groupValue: groupValue,
      onValueChanged: (value) {
        if (value != null) {
          onChanged?.call(value);
        }
      },
    );
  }
}

class _TextSegmentedItem extends StatelessWidget {
  const _TextSegmentedItem(
    this.title, {
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: WidgetStyle.tableVerticalPadding,
      child: Text(
        title,
        style: context.appTextTheme.titleSmall,
      ),
    );
  }
}
