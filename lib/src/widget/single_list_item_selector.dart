import 'package:items_selector/src/model/widget_type.dart';
import 'package:items_selector/src/model/select_options.dart';
import 'package:items_selector/src/model/base_list_item_selector.dart';

class SingleListItemSelector<T> extends BaseListItemSelector<T> {
  SingleListItemSelector({
    super.key,
    super.hasLongPress,
    super.initialItems,
    required super.items,
    required super.selectedItems,
    required super.builder,
    SingleSelectOptions? options,
    super.direction,
  }) : super(
          options: options,
          type: WidgetType.singleListItemSelector,
        );
}
