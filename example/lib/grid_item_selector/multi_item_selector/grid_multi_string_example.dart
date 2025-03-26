import 'package:flutter/material.dart';
import 'package:items_selector/items_selector.dart';

class GridMultiStringExample extends StatelessWidget {
  const GridMultiStringExample({super.key});

  static final List<String> stringItems = ["Android", "Ios"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multi list item (String)"),
      ),
      body: MultiGridItemSelector<String>(
        gridConfiguration: GridConfiguration(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 130.0,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
          ),
        ),
        items: stringItems,
        selectedItems: (List<String> selectedItems, _) {
          debugPrint(selectedItems.toString());
        },
        builder: (_, index) {
          return ItemSelector(
            selectedItem: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                stringItems[index].toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            unSelectedItem: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.deepOrange.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(stringItems[index].toString()),
            ),
          );
        },
      ),
    );
  }
}
