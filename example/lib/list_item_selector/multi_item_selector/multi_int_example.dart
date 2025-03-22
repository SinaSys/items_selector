import 'package:flutter/material.dart';
import 'package:items_selector/items_selector.dart';

class MultiIntExample extends StatelessWidget {
  const MultiIntExample({super.key});

  static final List<int> integerItems = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multi list item (Int)"),
      ),
      body: MultiListItemSelector<int>(
        items: integerItems,
        selectedItems: (List<int> selectedItems, _) {
          debugPrint(selectedItems.toString());
        },
        builder: (_, index) {
          return ItemSelector(
            selectedItem: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                integerItems[index].toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            unSelectedItem: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.deepOrange.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(integerItems[index].toString()),
            ),
          );
        },
      ),
    );
  }
}
