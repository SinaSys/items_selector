import 'package:flutter/material.dart';
import 'package:items_selector/items_selector.dart';
import 'package:items_selector/src/utils/extensions.dart';
import 'package:items_selector/src/model/base_selector.dart';
import 'package:items_selector/src/model/grid_configuration.dart';

class GridSelector<T> extends BaseSelector<T> {
  final BaseGridConfiguration gridConfiguration;

  GridSelector._({
    super.key,
    required super.items,
    required super.selectedItems,
    required super.builder,
    super.hasLongPress,
    super.initialItems,
    super.options,
    required this.gridConfiguration,
    required super.mode,
  });

  GridSelector.builder({
    super.key,
    required super.items,
    required super.selectedItems,
    required super.builder,
    super.hasLongPress,
    super.initialItems,
    super.options,
    required BuilderConfiguration builderConfiguration,
  })  : gridConfiguration = builderConfiguration,
        assert(
          options is! MultiSelectOptions || options.maxItems == null || options.maxItems! > 0,
          "maxItems should be a positive number and only applicable for MultiSelectOptions",
        ),
        assert(
          options is! MultiSelectOptions ||
              options.maxItems == null ||
              initialItems == null ||
              options.maxItems! > initialItems.length,
          "maxItems must be greater than the number of initialItems and only applicable for MultiSelectOptions",
        ),
        assert(
          options is! MultiSelectOptions || options.maxItems == null || options.maxItems! <= items.length,
          "maxItems must be less than or equal to the total number of items",
        ),
        super(mode: BaseSelector.determineWidgetType(options));

  GridSelector.count({
    super.key,
    required super.items,
    required super.selectedItems,
    required super.builder,
    super.hasLongPress,
    super.initialItems,
    super.options,
    required CountConfiguration countConfiguration,
  })  : gridConfiguration = countConfiguration,
        assert(
          options is! MultiSelectOptions || options.maxItems == null || options.maxItems! > 0,
          "maxItems should be a positive number",
        ),
        assert(
          options is! MultiSelectOptions ||
              options.maxItems == null ||
              initialItems == null ||
              options.maxItems! > initialItems.length,
          "maxItems must be greater than the number of initialItems",
        ),
        assert(
          options is! MultiSelectOptions || options.maxItems == null || options.maxItems! <= items.length,
          "maxItems must be less than or equal to the total number of items",
        ),
        super(mode: BaseSelector.determineWidgetType(options));

  GridSelector.extent({
    super.key,
    required super.items,
    required super.selectedItems,
    required super.builder,
    super.hasLongPress,
    super.initialItems,
    super.options,
    required ExtentConfiguration extentConfiguration,
  })  : gridConfiguration = extentConfiguration,
        assert(
          options is! MultiSelectOptions || options.maxItems == null || options.maxItems! > 0,
          "maxItems should be a positive number and only applicable for MultiSelectOptions",
        ),
        assert(
          options is! MultiSelectOptions ||
              options.maxItems == null ||
              initialItems == null ||
              options.maxItems! > initialItems.length,
          "maxItems must be greater than the number of initialItems and only applicable for MultiSelectOptions",
        ),
        assert(
          options is! MultiSelectOptions || options.maxItems == null || options.maxItems! <= items.length,
          "maxItems must be less than or equal to the total number of items",
        ),
        super(mode: BaseSelector.determineWidgetType(options));

  @override
  GridSelectorState<T> createState() => GridSelectorState<T>();
}

class GridSelectorState<T> extends BaseSelectorState<T> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> items = List.generate(
      itemsWrapper.length,
      (index) {
        ItemSelector item = widget.builder(context, index);
        return itemContainer(itemsWrapper[index], index, item);
      },
    );

    return switch (gridSelectorWidget.gridConfiguration) {
      BuilderConfiguration _ => _buildGridViewBuilder(),
      CountConfiguration _ => _buildGridViewCount(items),
      ExtentConfiguration _ => _buildGridViewExtent(items)
    };
  }

  Widget _buildGridViewBuilder() {
    final config = gridSelectorWidget.gridConfiguration as BuilderConfiguration;
    return GridView.builder(
      addAutomaticKeepAlives: config.addAutomaticKeepAlives,
      padding: config.padding,
      semanticChildCount: config.semanticChildCount,
      gridDelegate: config.gridDelegate,
      reverse: config.reverse,
      shrinkWrap: config.shrinkWrap,
      hitTestBehavior: config.hitTestBehavior,
      restorationId: config.restorationId,
      cacheExtent: config.cacheExtent,
      physics: config.physics,
      controller: config.controller,
      primary: config.primary,
      itemCount: itemsWrapper.length,
      clipBehavior: config.clipBehavior,
      keyboardDismissBehavior: config.keyboardDismissBehavior,
      key: config.key,
      dragStartBehavior: config.dragStartBehavior,
      addRepaintBoundaries: config.addRepaintBoundaries,
      addSemanticIndexes: config.addSemanticIndexes,
      findChildIndexCallback: config.findChildIndexCallback,
      scrollDirection: config.scrollDirection,
      itemBuilder: (context, index) {
        final item = widget.builder(context, index);
        return itemContainer(itemsWrapper[index], index, item);
      },
    );
  }

  Widget _buildGridViewCount(List<Widget> items) {
    final config = gridSelectorWidget.gridConfiguration as CountConfiguration;

    return GridView.count(
      key: config.key,
      crossAxisCount: config.crossAxisCount,
      crossAxisSpacing: config.crossAxisSpacing,
      childAspectRatio: config.childAspectRatio,
      mainAxisSpacing: config.mainAxisSpacing,
      scrollDirection: config.scrollDirection,
      clipBehavior: config.clipBehavior,
      primary: config.primary,
      physics: config.physics,
      controller: config.controller,
      restorationId: config.restorationId,
      shrinkWrap: config.shrinkWrap,
      dragStartBehavior: config.dragStartBehavior,
      cacheExtent: config.cacheExtent,
      hitTestBehavior: config.hitTestBehavior,
      reverse: config.reverse,
      addSemanticIndexes: config.addSemanticIndexes,
      addRepaintBoundaries: config.addRepaintBoundaries,
      keyboardDismissBehavior: config.keyboardDismissBehavior,
      addAutomaticKeepAlives: config.addAutomaticKeepAlives,
      semanticChildCount: config.semanticChildCount,
      padding: config.padding,
      children: items,
    );
  }

  Widget _buildGridViewExtent(List<Widget> items) {
    final config = gridSelectorWidget.gridConfiguration as ExtentConfiguration;
    return GridView.extent(
      maxCrossAxisExtent: config.maxCrossAxisExtent,
      mainAxisSpacing: config.mainAxisSpacing,
      childAspectRatio: config.childAspectRatio,
      crossAxisSpacing: config.crossAxisSpacing,
      padding: config.padding,
      semanticChildCount: config.semanticChildCount,
      keyboardDismissBehavior: config.keyboardDismissBehavior,
      reverse: config.reverse,
      hitTestBehavior: config.hitTestBehavior,
      addSemanticIndexes: config.addSemanticIndexes,
      restorationId: config.restorationId,
      shrinkWrap: config.shrinkWrap,
      addAutomaticKeepAlives: config.addAutomaticKeepAlives,
      controller: config.controller,
      cacheExtent: config.cacheExtent,
      addRepaintBoundaries: config.addRepaintBoundaries,
      physics: config.physics,
      primary: config.primary,
      dragStartBehavior: config.dragStartBehavior,
      clipBehavior: config.clipBehavior,
      key: config.key,
      scrollDirection: config.scrollDirection,
      children: items,
    );
  }
}
