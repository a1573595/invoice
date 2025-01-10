import 'package:flutter/material.dart';
import 'package:invoice/ui/theme/app_theme.dart';
import 'package:invoice/ui/theme/widget_style.dart';
import 'package:invoice/ui/widget/picker/picker_sheet.dart';

class TextPicker<T> extends StatefulWidget {
  const TextPicker({
    super.key,
    required this.children,
    required this.initialValue,
    this.onChanged,
    this.validator,
  });

  final Map<T, String> children;
  final T? initialValue;
  final ValueChanged<T>? onChanged;
  final String? Function(String value)? validator;

  @override
  State<TextPicker<T>> createState() => _TextPickerState<T>();
}

class _TextPickerState<T> extends State<TextPicker<T>> {
  late final TextEditingController controller;

  late T? selectedItem;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: widget.initialValue != null ? widget.children[widget.initialValue] : '');
    selectedItem = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    final enabled = widget.onChanged != null;

    return Focus(
      skipTraversal: true,
      descendantsAreTraversable: false,
      child: InkWell(
        borderRadius: WidgetStyle.cardRadius,
        onTap: enabled ? _showPickerSheet : null,
        child: IgnorePointer(
          child: TextFormField(
            enabled: enabled,
            controller: controller,
            style: context.appTextTheme.content.copyWith(color: enabled ? null : Theme.of(context).disabledColor),
            validator: (value) => widget.validator?.call(controller.text),
            decoration: InputDecoration(
              enabled: enabled,
              filled: !enabled,
              fillColor: Theme.of(context).disabledColor,
              suffixIcon: enabled
                  ? const Icon(
                      Icons.arrow_drop_down_outlined,
                    )
                  : null,
            ),
          ),
        ),
      ),
    );
  }

  void _showPickerSheet() {
    showPickerSheet(context, children: widget.children, initialValue: selectedItem).then((value) {
      if (value != null) {
        controller.text = '${widget.children[value]}';
        selectedItem = value;
        widget.onChanged?.call(value);
      }
    });
  }
}
