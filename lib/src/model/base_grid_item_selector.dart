import 'base_selector.dart';
import 'package:flutter/material.dart';
import 'package:items_selector/items_selector.dart';
import 'package:items_selector/src/utils/extensions.dart';

class BaseGridGridItemSelector<T> extends BaseSelector<T> {
  final GridConfiguration gridConfiguration;

  BaseGridGridItemSelector({
    super.key,
    required super.items,
    required super.builder,
    required super.selectedItems,
    super.initialItems,
    required super.type,
    required super.options,
    super.hasLongPress,
    required this.gridConfiguration,
  });

  @override
  BaseGridGridItemSelectorState<T> createState() => BaseGridGridItemSelectorState<T>();
}

class BaseGridGridItemSelectorState<T> extends BaseSelectorState<T> {
  @override
  Widget build(BuildContext context) {
    final config = baseGridItemSelectorWidget.gridConfiguration;

    return GridView.builder(
      key: baseGridItemSelectorWidget.key,
      findChildIndexCallback: config.findChildIndexCallback,
      scrollDirection: config.scrollDirection,
      hitTestBehavior: config.hitTestBehavior,
      itemCount: itemsWrapper.length,
      gridDelegate: config.gridDelegate,
      shrinkWrap: config.shrinkWrap,
      padding: config.padding,
      controller: config.controller,
      addRepaintBoundaries: config.addRepaintBoundaries,
      addSemanticIndexes: config.addSemanticIndexes,
      cacheExtent: config.cacheExtent,
      clipBehavior: config.clipBehavior,
      dragStartBehavior: config.dragStartBehavior,
      keyboardDismissBehavior: config.keyboardDismissBehavior,
      physics: config.physics,
      primary: config.primary,
      restorationId: config.restorationId,
      reverse: config.reverse,
      semanticChildCount: config.semanticChildCount,
      itemBuilder: (context, index) {
        final item = widget.builder(context, index);
        return itemContainer(itemsWrapper[index], index, item);
      },
    );
  }
}
