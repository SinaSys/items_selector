import 'package:flutter/material.dart';
import 'package:items_selector/src/utils/typedefs.dart';
import 'package:items_selector/src/model/check_box_selector_item.dart';

class CheckBoxSelector extends StatefulWidget {
  CheckBoxSelector({
    super.key,
    required this.items,
    required this.selectedItems,
    this.initialItems,
    this.options,
  })  : assert(
          initialItems == null || initialItems.isNotEmpty,
          'initialItems must not be an empty list if provided.',
        ),
        assert(
          initialItems == null || initialItems.every((index) => index >= 0 && index < items.length),
          'All initialItems must be valid indices of the items list.',
        );

  final List<CheckBoxSelectorItem> items;
  final OnSelectedCheckboxChanged selectedItems;
  final List<int>? initialItems;
  final CheckBoxSelectorOption? options;

  @override
  State<CheckBoxSelector> createState() => _CheckBoxSelectorState();
}

class _CheckBoxSelectorState extends State<CheckBoxSelector> {
  late Map<CheckBoxSelectorItem, bool> items;

  @override
  void initState() {
    items = widget.items.asMap().map((key, value) => (MapEntry(value, false)));
    if (widget.initialItems != null) {
      for (var i = 0; i < widget.initialItems!.length; ++i) {
        for (final index in widget.initialItems!) {
          if (index >= 0 && index < widget.items.length) {
            final item = widget.items[index];
            items[item] = true;
          }
        }
      }
    }
    super.initState();
  }

  void onChanged(CheckBoxSelectorItem item, bool isSelected) {
    items[item] = isSelected;

    List<CheckBoxSelectorItem> checkedItems = items.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key) //
        .toList(); //

    List<int> selectedIndex = items.entries
        .toList()
        .asMap()
        .entries
        .where((entry) => entry.value.value == true)
        .map((entry) => entry.key)
        .toList();

    widget.selectedItems(checkedItems, selectedIndex);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: widget.options?.spacing ?? 0.0,
      textBaseline: widget.options?.textBaseline,
      mainAxisSize: widget.options?.mainAxisSize ?? MainAxisSize.max,
      crossAxisAlignment: widget.options?.crossAxisAlignment ?? CrossAxisAlignment.center,
      verticalDirection: widget.options?.verticalDirection ?? VerticalDirection.down,
      textDirection: widget.options?.textDirection,
      mainAxisAlignment: widget.options?.mainAxisAlignment ?? MainAxisAlignment.start,
      children: List.generate(
        items.keys.length,
        (int index) {
          CheckBoxSelectorItem item = [...items.keys][index];
          CheckBoxSelectorOption? options = widget.options;
          return CheckboxListTile(
            key: item.key,
            value: [...items.values][index],
            onChanged: (bool? value) {
              onChanged(item, value!);
            },
            title: item.title,
            isThreeLine: item.isThreeLine,
            autofocus: item.autofocus,
            selected: item.selected,
            internalAddSemanticForOnTap: item.internalAddSemanticForOnTap,
            subtitle: item.subtitle ?? options?.subtitle,
            secondary: item.secondary ?? options?.secondary,
            activeColor: item.activeColor ?? options?.activeColor,
            contentPadding: item.contentPadding ?? options?.contentPadding,
            controlAffinity: item.controlAffinity ?? options?.controlAffinity,
            dense: item.dense ?? options?.dense,
            enableFeedback: item.enableFeedback ?? options?.enableFeedback,
            fillColor: item.fillColor ?? options?.fillColor,
            focusNode: item.focusNode ?? options?.focusNode,
            hoverColor: item.hoverColor ?? options?.hoverColor,
            materialTapTargetSize: item.materialTapTargetSize ?? options?.materialTapTargetSize,
            mouseCursor: item.mouseCursor ?? options?.mouseCursor,
            onFocusChange: item.onFocusChange ?? options?.onFocusChange,
            overlayColor: item.overlayColor ?? options?.overlayColor,
            selectedTileColor: item.selectedTileColor ?? options?.selectedTileColor,
            shape: item.shape ?? options?.shape,
            splashRadius: item.splashRadius ?? options?.splashRadius,
            tileColor: item.tileColor ?? options?.tileColor,
            visualDensity: item.visualDensity ?? options?.visualDensity,
          );
        },
      ),
    );
  }
}
