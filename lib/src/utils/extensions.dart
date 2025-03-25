import 'package:items_selector/src/model/item_wrapper.dart';
import 'package:items_selector/src/model/base_selector.dart';
import 'package:items_selector/src/model/base_list_item_selector.dart';
import 'package:items_selector/src/model/base_grid_item_selector.dart';
import 'package:items_selector/src/widget/multi_grid_item_selector.dart';
import 'package:items_selector/src/widget/multi_list_item_selector.dart';
import 'package:items_selector/src/widget/single_grid_item_selector.dart';

extension BaseSelectorExtension<T> on BaseSelectorState<T> {
  BaseGridGridItemSelector get baseGridItemSelectorWidget => widget as BaseGridGridItemSelector<T>;

  SingleGridItemSelector get singleGridItemSelectorWidget => widget as SingleGridItemSelector<T>;

  BaseListItemSelector get baseListItemSelectorWidget => widget as BaseListItemSelector<T>;

  MultiListItemSelector get multiListItemSelectorWidget => widget as MultiListItemSelector<T>;

  MultiGridItemSelector get multiGridItemSelector => widget as MultiGridItemSelector<T>;
}

extension ItemWrapperExtension<T> on List<ItemWrapper<T>> {
  /// Make all items selectable
  List<ItemWrapper<T>> defineInitialItems(List<T> initialItems) {
    List<ItemWrapper<T>> modifiedList = this;
    for (var mainItem in this) {
      for (var initialItem in initialItems) {
        if (mainItem.item == initialItem) {
          modifiedList[modifiedList.indexOf(mainItem)].isInitialItem = true;
          modifiedList[modifiedList.indexOf(mainItem)].isSelected = true;
        }
      }
    }
    return modifiedList;
  }
}
