import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:items_selector/items_selector.dart';
import 'package:items_selector/src/utils/extensions.dart';
import 'package:items_selector/src/model/base_selector.dart';
import 'package:items_selector/src/model/list_configuration.dart';

enum ListSelectorType {
  flex,
  builder,
  separated,
}

class ListSelector<T> extends BaseSelector<T> {
  final BaseListConfiguration? configuration;
  final IndexedWidgetBuilder? separatorBuilder;
  final Axis direction;
  final ListSelectorType selectorType;

  ListSelector({
    super.key,
    required super.items,
    required super.selectedItems,
    required super.builder,
    super.hasLongPress,
    super.initialItems,
    super.options,
    this.direction = Axis.horizontal,
    FlexConfiguration? flexConfiguration,
  })  : configuration = flexConfiguration,
        separatorBuilder = null,
        selectorType = ListSelectorType.flex,
        super(mode: BaseSelector.determineWidgetType(options));

  ListSelector.builder({
    super.key,
    required super.items,
    required super.selectedItems,
    required super.builder,
    super.hasLongPress,
    super.initialItems,
    super.options,
    ListConfiguration? listConfiguration,
    this.direction = Axis.vertical,
  })  : configuration = listConfiguration,
        separatorBuilder = null,
        selectorType = ListSelectorType.builder,
        super(mode: BaseSelector.determineWidgetType(options));

  ListSelector.separated({
    super.key,
    required super.items,
    required super.selectedItems,
    required this.separatorBuilder,
    required super.builder,
    super.hasLongPress,
    super.initialItems,
    super.options,
    ListConfiguration? listConfiguration,
    this.direction = Axis.vertical,
  })  : configuration = listConfiguration,
        selectorType = ListSelectorType.separated,
        super(
          mode: BaseSelector.determineWidgetType(options),
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

    return switch (listSelectorWidget.selectorType) {
      ListSelectorType.flex => _buildFlexList(items),
      _ => _buildConfiguredList(items)
    };
  }

  Widget _buildFlexList(List<Widget> items) {
    final FlexConfiguration? config = listSelectorWidget.configuration as FlexConfiguration?;

    return switch (listSelectorWidget.direction) {
      Axis.horizontal => Row(
          mainAxisAlignment: config?.mainAxisAlignment ?? MainAxisAlignment.start,
          spacing: config?.spacing ?? 0.0,
          textDirection: config?.textDirection,
          verticalDirection: config?.verticalDirection ?? VerticalDirection.down,
          crossAxisAlignment: config?.crossAxisAlignment ?? CrossAxisAlignment.center,
          mainAxisSize: config?.mainAxisSize ?? MainAxisSize.max,
          textBaseline: config?.textBaseline,
          children: items,
        ),
      Axis.vertical => Column(
          mainAxisAlignment: config?.mainAxisAlignment ?? MainAxisAlignment.start,
          spacing: config?.spacing ?? 0.0,
          textDirection: config?.textDirection,
          verticalDirection: config?.verticalDirection ?? VerticalDirection.down,
          crossAxisAlignment: config?.crossAxisAlignment ?? CrossAxisAlignment.center,
          mainAxisSize: config?.mainAxisSize ?? MainAxisSize.max,
          textBaseline: config?.textBaseline,
          children: items,
        )
    };
  }

  Widget _buildConfiguredList(List<Widget> items) {
    final ListConfiguration? config = listSelectorWidget.configuration as ListConfiguration?;

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
      primary: config?.primary,
      physics: config?.physics,
      cacheExtent: config?.cacheExtent,
      restorationId: config?.restorationId,
      shrinkWrap: config?.shrinkWrap ?? false,
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
