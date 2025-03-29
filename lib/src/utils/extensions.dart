import 'package:items_selector/items_selector.dart';
import 'package:items_selector/src/model/item_wrapper.dart';
import 'package:items_selector/src/model/base_selector.dart';
import 'package:items_selector/src/model/base_list_item_selector.dart';
import 'package:items_selector/src/model/base_wrap_item_selector.dart';

extension BaseSelectorExtension<T> on BaseSelectorState<T> {
  BaseWrapItemSelector get baseWrapItemSelectorWidget => widget as BaseWrapItemSelector<T>;

  BaseListItemSelector get baseListItemSelectorWidget => widget as BaseListItemSelector<T>;

  ListSelector get listSelectorWidget => widget as ListSelector<T>;

  GridSelector get gridSelectorWidget => widget as GridSelector<T>;

  WrapSelector get wrapSelectorWidget => widget as WrapSelector<T>;
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
