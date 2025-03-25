import 'item_wrapper.dart';
import 'item_selector.dart';
import 'package:flutter/widgets.dart';
import 'package:items_selector/src/utils/typedefs.dart';
import 'package:items_selector/src/utils/extensions.dart';
import 'package:items_selector/src/model/widget_type.dart';
import 'package:items_selector/src/model/select_options.dart';
import 'package:items_selector/src/utils/multi_select_util_mixin.dart';
import 'package:items_selector/src/utils/single_select_util_mixin.dart';

abstract class BaseSelector<T> extends StatefulWidget {
  BaseSelector({
    super.key,
    required this.items,
    required this.selectedItems,
    this.initialItems,
    required this.builder,
    this.options,
    this.hasLongPress = false,
    required this.type,
  }) : assert(
          options == null || options.allowUnselectInitialItem == false || initialItems != null,
          "If allowUnselectInitialItem is true, initialItems cannot be null",
        );

  final WidgetType type;
  final List<T> items;
  final List<T>? initialItems;
  final OnSelectedItemsChanged<T> selectedItems;
  final ItemBuilder builder;
  final SelectOptions? options;
  final bool hasLongPress;

  final BaseSelectorState<T> stateInstance = BaseSelectorState<T>();

  @override
  State<BaseSelector> createState() => BaseSelectorState<T>();
}

class BaseSelectorState<T> extends State<BaseSelector<T>> with SingleSelectUtil<T>, MultiSelectUtil<T> {
  late List<ItemWrapper<T>> itemsWrapper;

  @override
  void initState() {
    itemsWrapper = widget.items.map((T item) => ItemWrapper(item, false)).toList();
    hasInitialItems();
    super.initState();
  }

  void hasInitialItems() {
    final List<T>? initialItems = widget.initialItems;
    if (initialItems != null && initialItems.isNotEmpty) {
      itemsWrapper = itemsWrapper.defineInitialItems(initialItems);
    }
  }

  void setSelectionMode(SelectOptions? option, ItemWrapper<T> item) {
    switch (widget.type) {
      case WidgetType.singleListItemSelector || WidgetType.singleGridItemSelector:
        setSingleSelection(item);
      case WidgetType.multiListItemSelector || WidgetType.multiGridItemSelector:
        setMultiSelection(item, itemsWrapper.indexWhere((element) => element == item));
    }
  }

  void setSingleSelection(ItemWrapper<T> item) {
    if (widget.options != null) {
      var singleSelectOptions = widget.options as SingleSelectOptions;

      if (singleSelectOptions.allowUnselectMainItem!) {
        /// 1
        if (widget.options!.allowUnselectInitialItem!) {
          itemsWrapper = selectableMainItemsWithSelectableInitialItems(itemsWrapper, item);
        }

        ///2
        if (!singleSelectOptions.allowUnselectInitialItem!) {
          if (!item.isInitialItem) {
            itemsWrapper = selectableMainItemsWithUnSelectableInitialItems(itemsWrapper, item);
          }
        }
      }

      if (!singleSelectOptions.allowUnselectMainItem!) {
        ///3
        if (singleSelectOptions.allowUnselectInitialItem!) {
          itemsWrapper = unSelectableMainItemsWithSelectableInitialItems(itemsWrapper, item);
        }

        ///4
        if (!singleSelectOptions.allowUnselectInitialItem!) {
          itemsWrapper = unSelectableMainItemsWithUnSelectableInitialItems(itemsWrapper, item);
        }
      }
    } else {
      if (widget.initialItems != null && widget.initialItems!.isNotEmpty) {
        /// 1
        itemsWrapper = selectableMainItemsWithSelectableInitialItems(itemsWrapper, item);
      } else {
        ///2
        itemsWrapper = selectableMainItemsWithUnSelectableInitialItems(itemsWrapper, item);
      }
    }

    setState(() {});
  }

  void setMultiSelection(ItemWrapper<T> item, int index) {
    MultiSelectOptions? multiSelectOption = widget.options as MultiSelectOptions?;

    /// Option is set
    if (multiSelectOption != null) {
      /// Max items is set
      if (multiSelectOption.maxItems != null) {
        itemsWrapper = selectWithMaxItems(
          itemsWrapper: itemsWrapper,
          item: item,
          index: index,
          multiSelectOption: multiSelectOption,
        );
      } else {
        /// UnSelectableInitialItems
        if (multiSelectOption.allowUnselectInitialItem!) {
          itemsWrapper = selectWithUnSelectableInitialItems(
            itemsWrapper: itemsWrapper,
            item: item,
            index: index,
          );
        } else {
          /// selectableInitialItems
          itemsWrapper = selectWithSelectableInitialItems(
            itemsWrapper: itemsWrapper,
            item: item,
            index: index,
          );
        }
      }
    }

    /// Option is not set
    else {
      itemsWrapper = selectWithoutOption(
        itemsWrapper: itemsWrapper,
        item: item,
        index: index,
      );
    }
    setState(() {});
  }

  Widget itemContainer(ItemWrapper<T> itemWrapper, int index, ItemSelector item) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onLongPress: switch (widget.hasLongPress) {
          true => defineGestureEvent(itemWrapper, index),
          false => null,
        },
        onTap: switch (widget.hasLongPress) {
          false => defineGestureEvent(itemWrapper, index),
          true => null,
        },
        child: switch (itemsWrapper[index].isSelected) {
          true => item.selectedItem,
          false => item.unSelectedItem,
        },
      ),
    );
  }

  VoidCallback defineGestureEvent(ItemWrapper<T> itemWrapper, int index) {
    return switch (itemWrapper.activeLock) {
      false => () {
          setSelectionMode(widget.options, itemWrapper);
          List<T> items = itemsWrapper.where((element) => element.isSelected).map((e) => e.item).toList();
          widget.selectedItems(items.toList(), index);
        },
      true => () {}
    };
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
