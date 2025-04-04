import 'package:flutter/material.dart';
import 'package:items_selector/src/model/check_box_selector_item.dart';
import 'package:items_selector/src/utils/typedefs.dart';

class CheckBoxSelector extends StatefulWidget {
  const CheckBoxSelector({
    super.key,
    required this.items,
    this.initialItem,
    required this.selectedItems,
  });

  final List<CheckBoxSelectorItem> items;
  final OnSelectedItemsChanged selectedItems;
  final int? initialItem;

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        items.keys.length,
        (int index) {
          CheckBoxSelectorItem item = [...items.keys][index];
          return CheckboxListTile(
            key: item.key,
            value: [...items.values][index],
            onChanged: (bool? value) {
              items[item] = value!;
              setState(() {});
            },
            title: item.title,
            isThreeLine: item.isThreeLine,
            subtitle: item.subtitle,
            secondary: item.secondary,
            activeColor: item.activeColor,
            autofocus: item.autofocus,
            contentPadding: item.contentPadding,
            controlAffinity: item.controlAffinity,
            dense: item.dense,
            enableFeedback: item.enableFeedback,
            fillColor: item.fillColor,
            focusNode: item.focusNode,
            hoverColor: item.hoverColor,
            internalAddSemanticForOnTap: item.internalAddSemanticForOnTap,
            materialTapTargetSize: item.materialTapTargetSize,
            mouseCursor: item.mouseCursor,
            onFocusChange: item.onFocusChange,
            overlayColor: item.overlayColor,
            selected: item.selected,
            selectedTileColor: item.selectedTileColor,
            shape: item.shape,
            splashRadius: item.splashRadius,
            tileColor: item.tileColor,
            visualDensity: item.visualDensity,
          );
        },
      ),
    );
  }
}
