import 'package:items_selector/src/model/widget_type.dart';
import 'package:items_selector/src/model/select_options.dart';
import 'package:items_selector/src/model/base_list_item_selector.dart';

class MultiListItemSelector<T> extends BaseListItemSelector<T> {
  MultiListItemSelector({
    super.key,
    super.hasLongPress = false,
    super.initialItems,
    MultiSelectOptions? options,
    required super.items,
    required super.selectedItems,
    required super.builder,
    super.direction,
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
          type: WidgetType.multiListItemSelector,
        );
}
