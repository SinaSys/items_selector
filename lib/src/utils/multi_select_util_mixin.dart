import 'package:items_selector/src/model/item_wrapper.dart';
import 'package:items_selector/src/model/select_options.dart';

mixin MultiSelectUtil<T> {
  List<ItemWrapper<T>> selectWithMaxItems({
    required List<ItemWrapper<T>> itemsWrapper,
    required ItemWrapper<T> item,
    required int index,
    required MultiSelectOptions multiSelectOption,
  }) {
    for (var i = 0; i < itemsWrapper.length; ++i) {
      if (item.item == itemsWrapper[i].item) {
        if (itemsWrapper.where((item) => item.isSelected).length < multiSelectOption.maxItems!) {
          if (multiSelectOption.allowUnselectInitialItems!) {
            itemsWrapper[index].isSelected = !itemsWrapper[index].isSelected;
          } else {
            if (!item.isInitialItem) {
              itemsWrapper[index].isSelected = !itemsWrapper[index].isSelected;
            }
          }
        } else if (itemsWrapper[index].isSelected && !itemsWrapper[index].isInitialItem) {
          itemsWrapper[index].isSelected = !itemsWrapper[index].isSelected;
        }
      }
    }

    return itemsWrapper;
  }

  List<ItemWrapper<T>> selectWithUnSelectableInitialItems({
    required List<ItemWrapper<T>> itemsWrapper,
    required item,
    required int index,
  }) {
    for (var i = 0; i < itemsWrapper.length; ++i) {
      if (itemsWrapper[i].item == item.item) {
        itemsWrapper[index].isSelected = !itemsWrapper[index].isSelected;
      }
    }
    return itemsWrapper;
  }

  selectWithSelectableInitialItems({
    required List<ItemWrapper<T>> itemsWrapper,
    required item,
    required int index,
  }) {
    for (var i = 0; i < itemsWrapper.length; ++i) {
      if (itemsWrapper[i].item == item.item && !item.isInitialItem) {
        itemsWrapper[index].isSelected = !itemsWrapper[index].isSelected;
      }
    }

    return itemsWrapper;
  }

  List<ItemWrapper<T>> selectWithoutOption({
    required List<ItemWrapper<T>> itemsWrapper,
    required item,
    required int index,
  }) {
    for (var i = 0; i < itemsWrapper.length; ++i) {
      if (itemsWrapper[i].item == item.item) {
        itemsWrapper[index].isSelected = !itemsWrapper[index].isSelected;
      }
    }
    return itemsWrapper;
  }
}
