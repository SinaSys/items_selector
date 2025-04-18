import 'package:flutter/material.dart';
import 'package:items_selector/items_selector.dart';
import 'package:items_selector/src/utils/extensions.dart';
import 'package:items_selector/src/common/base_selector.dart';

class WrapSelector<T> extends BaseSelector<T> {
  final WrapConfiguration? wrapConfiguration;

  WrapSelector({
    super.key,
    this.wrapConfiguration,
    required super.items,
    required super.builder,
    required super.selectedItems,
    super.options,
    super.initialItems,
    super.hasLongPress,
  }) : super(mode: BaseSelector.determineWidgetType(options));

  @override
  WrapSelectorState<T> createState() => WrapSelectorState<T>();
}

class WrapSelectorState<T> extends BaseSelectorState<T> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> items = List.generate(
      itemsWrapper.length,
      (index) {
        ItemSelector item = widget.builder(context, index);
        return itemContainer(itemsWrapper[index], index, item);
      },
    );

    return _buildConfiguredWrap(items);
  }

  Widget _buildConfiguredWrap(List<Widget> items) {
    final WrapConfiguration? config = wrapSelectorWidget.wrapConfiguration;

    return Wrap(
      key: widget.key,
      direction: config?.direction ?? Axis.horizontal,
      crossAxisAlignment: config?.wrapCrossAxisAlignment ?? WrapCrossAlignment.start,
      runSpacing: config?.runSpacing ?? 0.0,
      spacing: config?.spacing ?? 0.0,
      alignment: config?.alignment ?? WrapAlignment.start,
      clipBehavior: config?.clipBehavior ?? Clip.none,
      runAlignment: config?.runAlignment ?? WrapAlignment.start,
      textDirection: config?.textDirection,
      verticalDirection: config?.verticalDirection ?? VerticalDirection.down,
      children: items,
    );
  }
}
