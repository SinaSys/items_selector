import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:items_selector/src/utils/extensions.dart';
import 'package:items_selector/src/model/widget_type.dart';
import 'package:items_selector/src/model/base_selector.dart';
import 'package:items_selector/src/model/item_selector.dart';
import 'package:items_selector/src/model/select_options.dart';

class MultiGridItemSelector<T> extends BaseSelector<T> {
  MultiGridItemSelector({
    super.key,
    super.hasLongPress = false,
    super.initialItems,
    MultiSelectOptions? options,
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
          type: WidgetType.multiGridItemSelector,
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
  MultiGridItemSelectorState<T> createState() => MultiGridItemSelectorState<T>();
}

class MultiGridItemSelectorState<T> extends BaseSelectorState<T> {
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
      findChildIndexCallback: multiGridItemSelector.findChildIndexCallback,
      scrollDirection: multiGridItemSelector.scrollDirection,
      hitTestBehavior: multiGridItemSelector.hitTestBehavior,
      key: multiGridItemSelector.key,
      itemCount: listItem.length,
      gridDelegate: multiGridItemSelector.gridDelegate,
      shrinkWrap: multiGridItemSelector.shrinkWrap,
      padding: multiGridItemSelector.padding,
      controller: multiGridItemSelector.controller,
      addAutomaticKeepAlives: multiGridItemSelector.addAutomaticKeepAlive,
      addRepaintBoundaries: multiGridItemSelector.addRepaintBoundaries,
      addSemanticIndexes: multiGridItemSelector.addSemanticIndexes,
      cacheExtent: multiGridItemSelector.cacheExtent,
      clipBehavior: multiGridItemSelector.clipBehavior,
      dragStartBehavior: multiGridItemSelector.dragStartBehavior,
      keyboardDismissBehavior: multiGridItemSelector.keyboardDismissBehavior,
      physics: multiGridItemSelector.physics,
      primary: multiGridItemSelector.primary,
      restorationId: multiGridItemSelector.restorationId,
      reverse: multiGridItemSelector.reverse,
      semanticChildCount: multiGridItemSelector.semanticChildCount,
      itemBuilder: (BuildContext context, int index) {
        return listItem[index];
      },
    );
  }
}
