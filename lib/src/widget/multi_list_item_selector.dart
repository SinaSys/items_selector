import 'package:flutter/material.dart';
import 'package:items_selector/src/utils/extensions.dart';
import 'package:items_selector/src/model/widget_type.dart';
import 'package:items_selector/src/model/base_selector.dart';
import 'package:items_selector/src/model/item_selector.dart';
import 'package:items_selector/src/model/select_options.dart';

class MultiListItemSelector<T> extends BaseSelector<T> {
  MultiListItemSelector({
    super.key,
    super.hasLongPress = false,
    super.initialItems,
    MultiSelectOptions? options,
    required super.items,
    required super.selectedItems,
    required super.builder,
    this.direction = Axis.horizontal,
  })  : assert(
          options?.maxItems == null || options!.maxItems! > 0,
          "maxItems should be a positive number",
        ),
        assert(
          options?.maxItems == null || initialItems == null || options!.maxItems! > initialItems.length,
          "maxItems must be greater than the number of initialItems",
        ),
        super(
          options: options,
          type: WidgetType.multiListItemSelector,
        );

  final Axis direction;

  @override
  MultiListItemSelectorState<T> createState() => MultiListItemSelectorState<T>();
}

class MultiListItemSelectorState<T> extends BaseSelectorState<T> {
  Widget defineWidgetByDirection(List<Widget> items) {
    return SingleChildScrollView(
      scrollDirection: multiListItemSelectorWidget.direction,
      child: switch (multiListItemSelectorWidget.direction) {
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
