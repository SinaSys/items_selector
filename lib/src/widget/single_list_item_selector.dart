import 'package:flutter/material.dart';
import 'package:items_selector/src/utils/extensions.dart';
import 'package:items_selector/src/model/widget_type.dart';
import 'package:items_selector/src/model/base_selector.dart';
import 'package:items_selector/src/model/item_selector.dart';
import 'package:items_selector/src/model/select_options.dart';

class SingleListItemSelector<T> extends BaseSelector<T> {
  SingleListItemSelector({
    super.key,
    super.hasLongPress,
    super.initialItems,
    required super.items,
    required super.selectedItems,
    required super.builder,
    this.direction = Axis.horizontal,
    SingleSelectOptions? options,
  }) : super(
          options: options,
          type: WidgetType.singleListItemSelector,
        );

  final Axis direction;

  @override
  SingleListItemSelectorState<T> createState() => SingleListItemSelectorState<T>();
}

class SingleListItemSelectorState<T> extends BaseSelectorState<T> {
  Widget defineWidgetByDirection(List<Widget> items) {
    return SingleChildScrollView(
      scrollDirection: singleListItemSelectorWidget.direction,
      child: switch (singleListItemSelectorWidget.direction) {
        Axis.horizontal => Row(children: items),
        Axis.vertical => Column(children: items)
      },
    );
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
