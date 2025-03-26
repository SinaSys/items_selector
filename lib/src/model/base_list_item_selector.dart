import 'base_selector.dart';
import 'package:flutter/material.dart';
import 'package:items_selector/items_selector.dart';
import 'package:items_selector/src/utils/extensions.dart';

class BaseListItemSelector<T> extends BaseSelector<T> {
  BaseListItemSelector({
    super.key,
    required super.items,
    required super.builder,
    required super.selectedItems,
    super.initialItems,
    required super.type,
    required super.options,
    super.hasLongPress,
    this.direction = Axis.horizontal,
  });

  final Axis direction;

  @override
  BaseGridGridItemSelectorState<T> createState() => BaseGridGridItemSelectorState<T>();
}

class BaseGridGridItemSelectorState<T> extends BaseSelectorState<T> {
  Widget defineWidgetByDirection(List<Widget> items) {
    return switch (baseListItemSelectorWidget.direction) {
      Axis.horizontal => Row(children: items),
      Axis.vertical => Column(children: items)
    };
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> listItem = List.generate(
      itemsWrapper.length,
      (index) {
        ItemSelector item = widget.builder(context, index);
        return itemContainer(itemsWrapper[index], index, item);
      },
    );
    return defineWidgetByDirection(listItem);
  }
}
