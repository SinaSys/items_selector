import 'package:flutter/material.dart';
import 'package:items_selector/items_selector.dart';

class MultiDoubleExample extends StatelessWidget {
  const MultiDoubleExample({super.key});

  static final List<double> doubleItems = [10.0, 20.0, 30.0, 40.0, 50.0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multi list item (Double)"),
      ),
      body: MultiListItemSelector<double>(
        items: doubleItems,
        selectedItems: (List<double> selectedItems, _) {
          debugPrint(selectedItems.toString());
        },
        builder: (_, index) {
          return ItemSelector(
            selectedItem: Container(
              margin: EdgeInsets.all(10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                doubleItems[index].toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            unSelectedItem: Container(
              margin: EdgeInsets.all(10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.deepOrange.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(doubleItems[index].toString()),
            ),
          );
        },
      ),
    );
  }
}
