import 'package:flutter/material.dart';
import 'package:items_selector/items_selector.dart';

class GridSingleIntExample extends StatelessWidget {
  const GridSingleIntExample({super.key});

  static final List<int> integerItems = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Single grid item (Int)"),
        ),
        body: SingleGridItemSelector<int>(
          gridConfiguration: GridConfiguration(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 130.0,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
            ),
          ),
          items: integerItems,
          selectedItems: (List<int> selectedItems, _) {
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
                  integerItems[index].toString(),
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
                child: Text(integerItems[index].toString()),
              ),
            );
          },
        ));
  }
}
