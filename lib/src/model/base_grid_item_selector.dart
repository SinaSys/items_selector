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
    final List<Widget> listItem = List.generate(
      itemsWrapper.length,
      (index) {
        ItemSelector item = widget.builder(context, index);
        return itemContainer(itemsWrapper[index], index, item);
      },
    );
    return GridView.builder(
      findChildIndexCallback: baseGridItemSelectorWidget.gridConfiguration.findChildIndexCallback,
      scrollDirection: baseGridItemSelectorWidget.gridConfiguration.scrollDirection,
      hitTestBehavior: baseGridItemSelectorWidget.gridConfiguration.hitTestBehavior,
      key: baseGridItemSelectorWidget.key,
      itemCount: listItem.length,
      gridDelegate: baseGridItemSelectorWidget.gridConfiguration.gridDelegate,
      shrinkWrap: baseGridItemSelectorWidget.gridConfiguration.shrinkWrap,
      padding: baseGridItemSelectorWidget.gridConfiguration.padding,
      controller: baseGridItemSelectorWidget.gridConfiguration.controller,
      addAutomaticKeepAlives: baseGridItemSelectorWidget.gridConfiguration.addAutomaticKeepAlive,
      addRepaintBoundaries: baseGridItemSelectorWidget.gridConfiguration.addRepaintBoundaries,
      addSemanticIndexes: baseGridItemSelectorWidget.gridConfiguration.addSemanticIndexes,
      cacheExtent: baseGridItemSelectorWidget.gridConfiguration.cacheExtent,
      clipBehavior: baseGridItemSelectorWidget.gridConfiguration.clipBehavior,
      dragStartBehavior: baseGridItemSelectorWidget.gridConfiguration.dragStartBehavior,
      keyboardDismissBehavior: baseGridItemSelectorWidget.gridConfiguration.keyboardDismissBehavior,
      physics: baseGridItemSelectorWidget.gridConfiguration.physics,
      primary: baseGridItemSelectorWidget.gridConfiguration.primary,
      restorationId: baseGridItemSelectorWidget.gridConfiguration.restorationId,
      reverse: baseGridItemSelectorWidget.gridConfiguration.reverse,
      semanticChildCount: baseGridItemSelectorWidget.gridConfiguration.semanticChildCount,
      itemBuilder: (BuildContext context, int index) {
        return listItem[index];
      },
    );
  }
}
