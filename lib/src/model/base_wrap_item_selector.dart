import 'base_selector.dart';
import 'package:flutter/material.dart';
import 'package:items_selector/items_selector.dart';
import 'package:items_selector/src/utils/extensions.dart';

class BaseWrapItemSelector<T> extends BaseSelector<T> {
  final WrapConfiguration? wrapConfiguration;

  BaseWrapItemSelector({
    super.key,
    required super.items,
    required super.builder,
    required super.selectedItems,
    super.initialItems,
    required super.type,
    required super.options,
    super.hasLongPress,
    this.wrapConfiguration,
  });

  @override
  BaseWrapItemSelectorState<T> createState() => BaseWrapItemSelectorState<T>();
}

class BaseWrapItemSelectorState<T> extends BaseSelectorState<T> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> listItem = List.generate(
      itemsWrapper.length,
      (index) {
        ItemSelector item = widget.builder(context, index);
        return itemContainer(itemsWrapper[index], index, item);
      },
    );
    return Wrap(
      key: widget.key,
      direction: baseWrapItemSelectorWidget.wrapConfiguration?.direction ?? Axis.horizontal,
      crossAxisAlignment: baseWrapItemSelectorWidget.wrapConfiguration?.crossAxisAlignment ?? WrapCrossAlignment.start,
      runSpacing: baseWrapItemSelectorWidget.wrapConfiguration?.runSpacing ?? 0.0,
      spacing: baseWrapItemSelectorWidget.wrapConfiguration?.spacing ?? 0.0,
      alignment: baseWrapItemSelectorWidget.wrapConfiguration?.alignment ?? WrapAlignment.start,
      clipBehavior: baseWrapItemSelectorWidget.wrapConfiguration?.clipBehavior ?? Clip.none,
      runAlignment: baseWrapItemSelectorWidget.wrapConfiguration?.runAlignment ?? WrapAlignment.start,
      textDirection: baseWrapItemSelectorWidget.wrapConfiguration?.textDirection,
      verticalDirection: baseWrapItemSelectorWidget.wrapConfiguration?.verticalDirection ?? VerticalDirection.down,
      children: listItem,
    );
  }
}
