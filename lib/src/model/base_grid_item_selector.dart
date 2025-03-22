import 'item_selector.dart';
import 'base_selector.dart';
import 'package:flutter/material.dart';
import 'package:items_selector/src/utils/extensions.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;

class BaseGridGridItemSelector<T> extends BaseSelector<T> {
  BaseGridGridItemSelector({
    super.key,
    required super.items,
    required super.builder,
    required this.gridDelegate,
    required super.selectedItems,
    super.initialItems,
    super.hasLongPress,
    super.options,
    this.reverse = false,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap = false,
    this.padding,
    this.addAutomaticKeepAlive = false,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.cacheExtent,
    this.semanticChildCount,
    this.dragStartBehavior = DragStartBehavior.start,
    this.clipBehavior = Clip.hardEdge,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.restorationId,
    required super.type,
  });

  final SliverGridDelegate gridDelegate;
  final bool reverse;
  final ScrollController? controller;
  final bool? primary;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final EdgeInsetsGeometry? padding;
  final bool addAutomaticKeepAlive;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final double? cacheExtent;
  final int? semanticChildCount;
  final DragStartBehavior dragStartBehavior;
  final Clip clipBehavior;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final String? restorationId;

  @override
  BaseGridItemSelectorState<T> createState() => BaseGridItemSelectorState<T>();
}

class BaseGridItemSelectorState<T> extends BaseSelectorState<T> {
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
      itemCount: listItem.length,
      gridDelegate: baseGridItemSelectorWidget.gridDelegate,
      shrinkWrap: baseGridItemSelectorWidget.shrinkWrap,
      padding: baseGridItemSelectorWidget.padding,
      controller: baseGridItemSelectorWidget.controller,
      addAutomaticKeepAlives: baseGridItemSelectorWidget.addAutomaticKeepAlive,
      addRepaintBoundaries: baseGridItemSelectorWidget.addRepaintBoundaries,
      addSemanticIndexes: baseGridItemSelectorWidget.addSemanticIndexes,
      cacheExtent: baseGridItemSelectorWidget.cacheExtent,
      clipBehavior: baseGridItemSelectorWidget.clipBehavior,
      dragStartBehavior: baseGridItemSelectorWidget.dragStartBehavior,
      keyboardDismissBehavior: baseGridItemSelectorWidget.keyboardDismissBehavior,
      physics: baseGridItemSelectorWidget.physics,
      primary: baseGridItemSelectorWidget.primary,
      restorationId: baseGridItemSelectorWidget.restorationId,
      reverse: baseGridItemSelectorWidget.reverse,
      semanticChildCount: baseGridItemSelectorWidget.semanticChildCount,
      itemBuilder: (BuildContext context, int index) {
        return listItem[index];
      },
    );
  }
}
