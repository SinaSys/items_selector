import 'package:flutter/material.dart' show immutable, Widget;

@immutable
final class ItemSelector {
  final Widget selectedItem;
  final Widget unSelectedItem;

  const ItemSelector({
    required this.selectedItem,
    required this.unSelectedItem,
  });
}
