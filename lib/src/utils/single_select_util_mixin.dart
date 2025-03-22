import 'package:items_selector/src/model/item_wrapper.dart';

mixin SingleSelectUtil<T> {
  /// 1
  List<ItemWrapper<T>> selectableMainItemsWithSelectableInitialItems(
    List<ItemWrapper<T>> itemsWrapper,
    ItemWrapper<T> item,
  ) {
    return itemsWrapper.map(
      (wrapper) {
        return wrapper
          ..isSelected = switch (wrapper.item == item.item) {
            true => !wrapper.isSelected,
            false => false,
          };
      },
    ).toList();
  }

  /// 2
  List<ItemWrapper<T>> selectableMainItemsWithUnSelectableInitialItems(
    List<ItemWrapper<T>> itemsWrapper,
    ItemWrapper<T> item,
  ) {
    for (var i = 0; i < itemsWrapper.length; ++i) {
      if (!itemsWrapper[i].isInitialItem) {
        itemsWrapper[i].isSelected = itemsWrapper[i].item == item.item ? !itemsWrapper[i].isSelected : false;
      }
    }

    return itemsWrapper;
  }

  /// 3
  List<ItemWrapper<T>> unSelectableMainItemsWithSelectableInitialItems(
    List<ItemWrapper<T>> itemsWrapper,
    ItemWrapper<T> item,
  ) {
    for (var i = 0; i < itemsWrapper.length; ++i) {
      itemsWrapper[i].isSelected = false;
    }
    for (var i = 0; i < itemsWrapper.length; ++i) {
      if (itemsWrapper[i].item == item.item) {
        itemsWrapper[i].isSelected = true;
      }
    }

    return itemsWrapper;
  }

  /// 4
  List<ItemWrapper<T>> unSelectableMainItemsWithUnSelectableInitialItems(
    List<ItemWrapper<T>> itemsWrapper,
    ItemWrapper<T> item,
  ) {
    if (!item.isInitialItem) {
      for (var i = 0; i < itemsWrapper.length; ++i) {
        if (!itemsWrapper[i].isInitialItem) {
          itemsWrapper[i].isSelected = itemsWrapper[i].item == item.item;
        }
      }
    }

    return itemsWrapper;
  }
}
