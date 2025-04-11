import 'package:flutter/material.dart';
import 'package:items_selector/src/utils/typedefs.dart';
import 'package:items_selector/src/model/radio_selector_item.dart';

class RadioSelector extends StatefulWidget {
  const RadioSelector({
    super.key,
    required this.items,
    required this.selectedItems,
    this.initialItem,
    this.options,
  }) : assert(
          initialItem == null || (initialItem >= 0 && initialItem < items.length),
          'initialItem must be a valid index of the items list.',
        );

  final List<RadioSelectorItem> items;
  final OnSelectedRadioChanged<RadioSelectorItem> selectedItems;
  final RadioSelectorOption? options;
  final int? initialItem;

  @override
  State<RadioSelector> createState() => _RadioSelectorState();
}

class _RadioSelectorState extends State<RadioSelector> {
  RadioSelectorItem? selectedRadio;

  @override
  void initState() {
    if (widget.initialItem != null) {
      selectedRadio = widget.items[widget.initialItem!];
    }
    super.initState();
  }

  setSelectedRadio(RadioSelectorItem? item) {
    selectedRadio = item!;
    widget.selectedItems(selectedRadio!, widget.items.indexOf(item));
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
        widget.items.length,
        (int index) {
          RadioSelectorItem item = widget.items[index];
          RadioSelectorOption? options = widget.options;
          return RadioListTile<RadioSelectorItem>(
            key: item.key,
            value: item,
            groupValue: selectedRadio,
            onChanged: setSelectedRadio,
            title: item.title,
            subtitle: item.subtitle,
            isThreeLine: item.isThreeLine,
            toggleable: item.toggleable,
            autofocus: item.autofocus,
            selected: item.selected,
            internalAddSemanticForOnTap: item.internalAddSemanticForOnTap,
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
