import 'package:flutter/widgets.dart' show BuildContext;
import 'package:items_selector/src/model/item_selector.dart';

typedef OnSelectedItemsChanged<T> = void Function(List<T>, int index);
typedef OnSelectedRadioChanged<T> = void Function(T);
typedef ItemBuilder = ItemSelector Function(BuildContext context, int index);
