import 'package:flutter/material.dart';
import 'package:items_selector/src/utils/typedefs.dart';
import 'package:items_selector/src/model/check_box_selector_item.dart';

class CheckBoxSelector extends StatefulWidget {
  const CheckBoxSelector({
    super.key,
    required this.items,
    this.initialItem,
    required this.selectedItems,
    this.options,
  });

  final List<CheckBoxSelectorItem> items;
  final OnSelectedCheckboxChanged selectedItems;
  final int? initialItem;
  final CheckBoxSelectorOption? options;

  @override
  State<CheckBoxSelector> createState() => _CheckBoxSelectorState();
}

class _CheckBoxSelectorState extends State<CheckBoxSelector> {
  late Map<CheckBoxSelectorItem, bool> items;

  @override
  void initState() {
    items = widget.items.asMap().map((key, value) => (MapEntry(value, false)));
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
