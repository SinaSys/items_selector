import 'package:items_selector/items_selector.dart';
import 'package:items_selector/src/model/widget_type.dart';
import 'package:items_selector/src/model/base_wrap_item_selector.dart';

class SingleWrapItemSelector<T> extends BaseWrapItemSelector<T> {
  SingleWrapItemSelector({
    super.key,
    required super.items,
    required super.builder,
    required super.selectedItems,
    SingleSelectOptions? options,
    super.wrapConfiguration,
    super.hasLongPress,
    super.initialItems,
  }) : super(
          options: options,
          type: WidgetType.singleWrapItemSelector,
        );
}
