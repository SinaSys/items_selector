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
  Widget defineWidgetByDirection(List<Widget> items) {
    if (baseListItemSelectorWidget.listConfiguration != null) {
      return ListView.builder(
        scrollDirection: baseListItemSelectorWidget.direction,
        padding: baseListItemSelectorWidget.listConfiguration?.padding,
        reverse: baseListItemSelectorWidget.listConfiguration?.reverse ?? false,
        clipBehavior: baseListItemSelectorWidget.listConfiguration?.clipBehavior ?? Clip.hardEdge,
        controller: baseListItemSelectorWidget.listConfiguration?.controller,
        itemExtent: baseListItemSelectorWidget.listConfiguration?.itemExtent,
        primary: baseListItemSelectorWidget.listConfiguration?.primary,
        physics: baseListItemSelectorWidget.listConfiguration?.physics,
        cacheExtent: baseListItemSelectorWidget.listConfiguration?.cacheExtent,
        prototypeItem: baseListItemSelectorWidget.listConfiguration?.prototypeItem,
        restorationId: baseListItemSelectorWidget.listConfiguration?.restorationId,
        shrinkWrap: baseListItemSelectorWidget.listConfiguration?.shrinkWrap ?? false,
        itemExtentBuilder: baseListItemSelectorWidget.listConfiguration?.itemExtentBuilder,
        keyboardDismissBehavior: baseListItemSelectorWidget.listConfiguration?.keyboardDismissBehavior ??
            ScrollViewKeyboardDismissBehavior.manual,
        dragStartBehavior: baseListItemSelectorWidget.listConfiguration?.dragStartBehavior ?? DragStartBehavior.start,
        hitTestBehavior: baseListItemSelectorWidget.listConfiguration?.hitTestBehavior ?? HitTestBehavior.opaque,
        semanticChildCount: baseListItemSelectorWidget.listConfiguration?.semanticChildCount,
        itemCount: items.length,
        itemBuilder: (_, int index) {
          return items[index];
        },
      );
    }
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
