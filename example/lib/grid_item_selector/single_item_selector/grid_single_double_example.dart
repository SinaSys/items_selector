import 'package:flutter/material.dart';
import 'package:items_selector/items_selector.dart';

class GridSingleDoubleExample extends StatelessWidget {
  const GridSingleDoubleExample({super.key});

  static final List<double> doubleItems = [10.0, 20.0, 30.0, 40.0, 50.0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Single grid item (Double)"),
      ),
      body: SingleGridItemSelector<double>(
        gridConfiguration: GridConfiguration(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 130.0,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
          ),
        ),
        items: doubleItems,
        selectedItems: (List<double> selectedItems, _) {
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
                doubleItems[index].toString(),
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
              child: Text(doubleItems[index].toString()),
            ),
          );
        },
      ),
    );
  }
}
