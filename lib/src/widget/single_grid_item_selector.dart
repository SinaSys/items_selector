import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:items_selector/src/utils/extensions.dart';
import 'package:items_selector/src/model/widget_type.dart';
import 'package:items_selector/src/model/base_selector.dart';
import 'package:items_selector/src/model/item_selector.dart';
import 'package:items_selector/src/model/select_options.dart';

class SingleGridItemSelector<T> extends BaseSelector<T> {
  SingleGridItemSelector({
    super.key,
    super.hasLongPress = false,
    super.initialItems,
    SingleSelectOptions? options,
    required super.items,
    required super.selectedItems,
    required super.builder,
    this.reverse = false,
    required this.gridDelegate,
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
    this.hitTestBehavior = HitTestBehavior.opaque,
    this.scrollDirection = Axis.vertical,
    this.findChildIndexCallback,
  }) : super(
          options: options,
          type: WidgetType.singleGridItemSelector,
        );

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
  final HitTestBehavior hitTestBehavior;
  final Axis scrollDirection;
  final ChildIndexGetter? findChildIndexCallback;

  @override
  SingleGridItemSelectorState<T> createState() => SingleGridItemSelectorState<T>();
}

class SingleGridItemSelectorState<T> extends BaseSelectorState<T> {
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
      findChildIndexCallback: singleGridItemSelectorWidget.findChildIndexCallback,
      scrollDirection: singleGridItemSelectorWidget.scrollDirection,
      hitTestBehavior: singleGridItemSelectorWidget.hitTestBehavior,
      key: singleGridItemSelectorWidget.key,
      itemCount: listItem.length,
      gridDelegate: singleGridItemSelectorWidget.gridDelegate,
      shrinkWrap: singleGridItemSelectorWidget.shrinkWrap,
      padding: singleGridItemSelectorWidget.padding,
      controller: singleGridItemSelectorWidget.controller,
      addAutomaticKeepAlives: singleGridItemSelectorWidget.addAutomaticKeepAlive,
      addRepaintBoundaries: singleGridItemSelectorWidget.addRepaintBoundaries,
      addSemanticIndexes: singleGridItemSelectorWidget.addSemanticIndexes,
      cacheExtent: singleGridItemSelectorWidget.cacheExtent,
      clipBehavior: singleGridItemSelectorWidget.clipBehavior,
      dragStartBehavior: singleGridItemSelectorWidget.dragStartBehavior,
      keyboardDismissBehavior: singleGridItemSelectorWidget.keyboardDismissBehavior,
      physics: singleGridItemSelectorWidget.physics,
      primary: singleGridItemSelectorWidget.primary,
      restorationId: singleGridItemSelectorWidget.restorationId,
      reverse: singleGridItemSelectorWidget.reverse,
      semanticChildCount: singleGridItemSelectorWidget.semanticChildCount,
      itemBuilder: (BuildContext context, int index) {
        return listItem[index];
      },
    );
  }
}
