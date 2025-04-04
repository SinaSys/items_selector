import 'package:flutter/material.dart';
import 'package:items_selector/src/utils/typedefs.dart';
import 'package:items_selector/src/model/radio_selector_item.dart';

class RadioSelector extends StatefulWidget {
  const RadioSelector({
    super.key,
    required this.items,
    required this.selectedItems,
    this.initialItem,
  });

  final List<RadioSelectorItem> items;
  final OnSelectedRadioChanged<RadioSelectorItem> selectedItems;
  final int? initialItem;

  @override
  State<RadioSelector> createState() => _RadioSelectorState();
}

class _RadioSelectorState extends State<RadioSelector> {
  late RadioSelectorItem selectedRadio;

  @override
  void initState() {
    if (widget.initialItem != null) {
      selectedRadio = widget.items[widget.initialItem!];
    } else {
      selectedRadio = widget.items.first;
    }
    super.initState();
  }

  setSelectedRadio(RadioSelectorItem? item) {
    selectedRadio = item!;
    widget.selectedItems(selectedRadio);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        widget.items.length,
        (int index) {
          RadioSelectorItem item = widget.items[index];
          return RadioListTile<RadioSelectorItem>(
            key: item.key,
            value: item,
            title: item.title,
            groupValue: selectedRadio,
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
            toggleable: item.toggleable,
            visualDensity: item.visualDensity,
            onChanged: setSelectedRadio,
          );
        },
      ),
    );
  }
}
