import 'package:flutter/material.dart';
import 'package:items_selector/src/utils/typedefs.dart';
import 'package:items_selector/src/model/radio_selector_item.dart';

enum RadioSelectorType {
  simple,
  custom,
}

class RadioSelector extends StatefulWidget {
  const RadioSelector({
    super.key,
    required this.items,
    required this.selectedItems,
    this.initialItem,
    this.options,
  })  : assert(
          initialItem == null || (initialItem >= 0 && initialItem < items.length),
          'initialItem must be a valid index of the items list.',
        ),
        direction = null,
        customRadioSelectorOption = null,
        customItems = const [],
        separator = null,
        _type = RadioSelectorType.simple;

  const RadioSelector.custom({
    super.key,
    required this.selectedItems,
    required this.customItems,
    this.initialItem,
    this.customRadioSelectorOption,
    this.direction = Axis.vertical,
    this.separator,
  })  : options = null,
        items = const [],
        _type = RadioSelectorType.custom;

  final List<RadioSelectorItem> items;
  final List<CustomRadioSelectorItem> customItems;
  final OnSelectedRadioChanged<RadioSelectorItem> selectedItems;
  final RadioSelectorOption? options;
  final CustomRadioSelectorOption? customRadioSelectorOption;
  final int? initialItem;
  final Axis? direction;
  final RadioSelectorType _type;
  final Widget? separator;

  @override
  State<RadioSelector> createState() => _RadioSelectorState();
}

class _RadioSelectorState extends State<RadioSelector> {
  RadioSelectorItem? selectedRadio;
  CustomRadioSelectorItem? customSelectedRadio;

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
    return switch (widget._type) {
      RadioSelectorType.simple => buildRadioListSelectorWidget(),
      RadioSelectorType.custom => buildCustomRadioListSelectorWidget(widget.direction),
    };
  }

  Widget buildRadioListSelectorWidget() {
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

  Widget buildCustomRadioListSelectorWidget(Axis? direction) {
    final List<CustomRadioSelectorItem> items = widget.customItems;
    final CustomRadioSelectorOption? option = widget.customRadioSelectorOption;
    return Flex(
      direction: direction ?? Axis.vertical,
      children: List.generate(
        items.length,
        (index) {
          final CustomRadioSelectorItem item = items[index];
          return Row(
            spacing: item.layoutOption?.spacing ?? 0.0,
            textBaseline: item.layoutOption?.textBaseline,
            mainAxisSize: item.layoutOption?.mainAxisSize ?? MainAxisSize.max,
            crossAxisAlignment: item.layoutOption?.crossAxisAlignment ?? CrossAxisAlignment.center,
            verticalDirection: item.layoutOption?.verticalDirection ?? VerticalDirection.down,
            textDirection: item.layoutOption?.textDirection,
            mainAxisAlignment: item.layoutOption?.mainAxisAlignment ?? MainAxisAlignment.start,
            children: [
              item.leading ?? SizedBox(),
              Radio(
                value: item,
                groupValue: customSelectedRadio,
                autofocus: item.radioOption?.autofocus ?? option?.autofocus ?? false,
                focusNode: item.radioOption?.focusNode ?? option?.focusNode,
                materialTapTargetSize: item.radioOption?.materialTapTargetSize ?? option?.materialTapTargetSize,
                visualDensity: item.radioOption?.visualDensity ?? option?.visualDensity,
                fillColor: item.radioOption?.fillColor ?? option?.fillColor,
                toggleable: item.radioOption?.toggleable ?? option?.toggleable ?? false,
                splashRadius: item.radioOption?.splashRadius ?? option?.splashRadius,
                overlayColor: item.radioOption?.overlayColor ?? option?.overlayColor,
                mouseCursor: item.radioOption?.mouseCursor ?? option?.mouseCursor,
                hoverColor: item.radioOption?.hoverColor ?? option?.hoverColor,
                activeColor: item.radioOption?.activeColor ?? option?.activeColor,
                focusColor: item.radioOption?.focusColor ?? option?.focusColor,
                onChanged: (item) {
                  customSelectedRadio = item!;
                  //widget.selectedItems(selectedRadio!, widget.items.indexOf(item));
                  setState(() {});
                },
              ),
              item.trailing ?? SizedBox(),
            ],
          );
        },
      )
          .expand(
            (item) => [
              item,
              if (widget.separator != null) widget.separator!,
            ],
          )
          .toList(),
    );
  }
}
