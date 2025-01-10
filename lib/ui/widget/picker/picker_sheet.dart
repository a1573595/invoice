import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invoice/common/i18n/l10n.dart';
import 'package:invoice/ui/theme/app_theme.dart';
import 'package:invoice/ui/theme/text/font_weigh_enum.dart';
import 'package:invoice/ui/theme/widget_style.dart';

Future<T?> showPickerSheet<T>(
  BuildContext context, {
  required Map<T, String> children,
  T? initialValue,
}) {
  FocusManager.instance.primaryFocus?.unfocus();

  return showCupertinoModalPopup(
    context: context,
    builder: (context) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      margin: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      decoration: BoxDecoration(
        color: context.appColorTheme.surface,
        borderRadius: WidgetStyle.bottomSheetRadius,
      ),
      child: SafeArea(
        top: false,
        child: _PickerSheet(
          children,
          initialValue ?? children.keys.first,
        ),
      ),
    ),
  );
}

class _PickerSheet<T> extends StatefulWidget {
  const _PickerSheet(this.children, this.initialValue, {super.key});

  final Map<T, String> children;
  final T initialValue;

  @override
  State<_PickerSheet<T>> createState() => _PickerSheetState<T>();
}

class _PickerSheetState<T> extends State<_PickerSheet<T>> {
  late T _selectedItem;

  late final FixedExtentScrollController _controller;

  @override
  void initState() {
    super.initState();

    _selectedItem = widget.initialValue;

    final value = widget.children.keys.toList().indexOf(widget.initialValue);
    final initialIndex = value == -1 ? 0 : value;

    _controller = FixedExtentScrollController(initialItem: initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    final itemExtent = context.appTextTheme.titleMedium.fontSize! + WidgetStyle.pickerItemExtent;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: Navigator.of(context).pop,
              child: Text(
                L10n.tr.cancel,
                style: context.appTextTheme.titleMedium,
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(_selectedItem),
              child: Text(
                L10n.tr.save,
                style: context.appTextTheme.titleMedium.copyWith(
                  color: context.appColorTheme.primary,
                  fontWeight: FontWeighEnum.bold.value,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: itemExtent * 7,
          child: ScrollConfiguration(
            behavior: const CupertinoScrollBehavior(),
            child: CupertinoPicker(
              selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
                background: Theme.of(context).highlightColor,
              ),
              scrollController: _controller,
              magnification: WidgetStyle.pickerMagnification,
              squeeze: WidgetStyle.pickerSqueeze,
              useMagnifier: true,
              itemExtent: itemExtent,
              onSelectedItemChanged: (value) => _selectedItem = widget.children.keys.elementAt(value),
              children: widget.children.values
                  .map(
                    (e) => Center(
                      child: Text(
                        e,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
