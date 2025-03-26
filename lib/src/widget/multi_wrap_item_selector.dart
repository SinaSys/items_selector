import 'package:items_selector/items_selector.dart';
import 'package:items_selector/src/model/widget_type.dart';
import 'package:items_selector/src/model/base_wrap_item_selector.dart';

class MultiWrapItemSelector<T> extends BaseWrapItemSelector<T> {
  MultiWrapItemSelector({
    super.key,
    required super.items,
    required super.builder,
    required super.selectedItems,
    super.wrapConfiguration,
    MultiSelectOptions? options,
    super.hasLongPress,
    super.initialItems,
  }) : super(
          options: options,
          type: WidgetType.multiWrapItemSelector,
        );
}
