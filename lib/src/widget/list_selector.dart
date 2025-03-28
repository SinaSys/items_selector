import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:items_selector/items_selector.dart';
import 'package:items_selector/src/utils/extensions.dart';
import 'package:items_selector/src/model/base_selector.dart';

class ListSelector<T> extends BaseSelector<T> {
  final ListConfiguration? listConfiguration;
  final IndexedWidgetBuilder? separatorBuilder;
  final Axis direction;

  ListSelector._({
    super.key,
    required super.items,
    required super.type,
    required super.selectedItems,
    required super.builder,
    super.hasLongPress,
    super.initialItems,
    super.options,
    this.direction = Axis.horizontal,
  })  : listConfiguration = null,
        separatorBuilder = null;

  ListSelector.builder({
    super.key,
    required super.items,
    required super.selectedItems,
    required super.builder,
    super.hasLongPress,
    super.initialItems,
    super.options,
    this.listConfiguration,
    this.direction = Axis.vertical,
  })  : separatorBuilder = null,
        super(type: BaseSelector.determineWidgetType(options));

  ListSelector.separated({
    super.key,
    required super.items,
    required super.selectedItems,
    required this.separatorBuilder,
    required super.builder,
    super.hasLongPress,
    super.initialItems,
    super.options,
    this.listConfiguration,
    this.direction = Axis.vertical,
  }) : super(
          type: BaseSelector.determineWidgetType(options),
        );

  @override
  ListSelectorState<T> createState() => ListSelectorState<T>();
}

class ListSelectorState<T> extends BaseSelectorState<T> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> items = List.generate(
      itemsWrapper.length,
      (index) {
        ItemSelector item = widget.builder(context, index);
        return itemContainer(itemsWrapper[index], index, item);
      },
    );

    return _buildConfiguredList(items);
  }

  Widget _buildConfiguredList(List<Widget> items) {
    final ListConfiguration? config = listSelectorWidget.listConfiguration;

    if (listSelectorWidget.separatorBuilder != null) {
      return ListView.separated(
        scrollDirection: listSelectorWidget.direction,
        padding: config?.padding,
        reverse: config?.reverse ?? false,
        clipBehavior: config?.clipBehavior ?? Clip.hardEdge,
        controller: config?.controller,
        primary: config?.primary,
        physics: config?.physics,
        cacheExtent: config?.cacheExtent,
        restorationId: config?.restorationId,
        shrinkWrap: config?.shrinkWrap ?? false,
        keyboardDismissBehavior: config?.keyboardDismissBehavior ?? ScrollViewKeyboardDismissBehavior.manual,
        dragStartBehavior: config?.dragStartBehavior ?? DragStartBehavior.start,
        hitTestBehavior: config?.hitTestBehavior ?? HitTestBehavior.opaque,
        itemCount: itemsWrapper.length,
        itemBuilder: (context, index) {
          final item = widget.builder(context, index);
          return itemContainer(itemsWrapper[index], index, item);
        },
        separatorBuilder: listSelectorWidget.separatorBuilder!,
      );
    }

    return ListView.builder(
      scrollDirection: listSelectorWidget.direction,
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
      itemCount: itemsWrapper.length,
      itemBuilder: (context, index) {
        final item = widget.builder(context, index);
        return itemContainer(itemsWrapper[index], index, item);
      },
    );
  }
}
