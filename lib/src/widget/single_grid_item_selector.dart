import 'package:items_selector/src/model/widget_type.dart';
import 'package:items_selector/src/model/select_options.dart';
import 'package:items_selector/src/model/base_grid_item_selector.dart';

class SingleGridItemSelector<T> extends BaseGridGridItemSelector<T> {
  SingleGridItemSelector({
    super.key,
    required super.items,
    required super.builder,
    required super.selectedItems,
    required super.gridConfiguration,
    SingleSelectOptions? options,
    super.hasLongPress,
    super.initialItems,
  }) : super(
          options: options,
          type: WidgetType.singleGridItemSelector,
        );
}
