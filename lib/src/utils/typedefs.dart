import 'package:items_selector/items_selector.dart';
import 'package:flutter/widgets.dart' show BuildContext;

typedef OnSelectedItemsChanged<T> = void Function(List<T>, int index);
typedef OnSelectedRadioChanged<T> = void Function(T,int index);
typedef OnSelectedCheckboxChanged = void Function(List<CheckBoxSelectorItem>, List<int> index);
typedef ItemBuilder = ItemSelector Function(BuildContext context, int index);
