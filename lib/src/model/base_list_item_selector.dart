import 'base_selector.dart';
import 'package:flutter/material.dart';
import 'package:items_selector/items_selector.dart';
import 'package:items_selector/src/utils/extensions.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;

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
    this.listConfiguration,
  });

  final Axis direction;
  final ListConfiguration? listConfiguration;

  @override
  BaseGridGridItemSelectorState<T> createState() => BaseGridGridItemSelectorState<T>();
}

class BaseGridGridItemSelectorState<T> extends BaseSelectorState<T> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> listItem = List.generate(
      itemsWrapper.length,
      (index) {
        ItemSelector item = widget.builder(context, index);
        return itemContainer(itemsWrapper[index], index, item);
      },
    );
    return _buildWidget(listItem);
  }

  Widget _buildWidget(List<Widget> items) {
    final widget = baseListItemSelectorWidget;

    if (widget.listConfiguration != null) {
      return _buildScrollableList(items, widget.listConfiguration);
    }
    return _buildSimpleList(items);
  }

  Widget _buildSimpleList(List<Widget> items) {
    return switch (baseListItemSelectorWidget.direction) {
      Axis.horizontal => Row(children: items),
      Axis.vertical => Column(children: items),
    };
  }

  Widget _buildScrollableList(List<Widget> items, ListConfiguration? config) {
    return ListView.builder(
      scrollDirection: baseListItemSelectorWidget.direction,
      padding: config?.padding,
      reverse: config?.reverse ?? false,
      clipBehavior: config?.clipBehavior ?? Clip.hardEdge,
      controller: config?.controller,
      itemExtent: config?.itemExtent,
      primary: config?.primary,
      physics: config?.physics,
      cacheExtent: config?.cacheExtent,
      prototypeItem: config?.prototypeItem,
      restorationId: config?.restorationId,
      shrinkWrap: config?.shrinkWrap ?? false,
      itemExtentBuilder: config?.itemExtentBuilder,
      keyboardDismissBehavior: config?.keyboardDismissBehavior ?? ScrollViewKeyboardDismissBehavior.manual,
      dragStartBehavior: config?.dragStartBehavior ?? DragStartBehavior.start,
      hitTestBehavior: config?.hitTestBehavior ?? HitTestBehavior.opaque,
      semanticChildCount: config?.semanticChildCount,
      itemCount: items.length,
      itemBuilder: (_, int index) {
        return items[index];
      },
    );
  }
}
