import 'package:flutter/material.dart';
import 'package:items_selector/items_selector.dart';

class ListSingleDoubleExample extends StatefulWidget {
  const ListSingleDoubleExample({super.key});

  static final List<double> doubleItems = [10.0, 20.0, 30.0, 40.0, 50.0];

  @override
  State<ListSingleDoubleExample> createState() => _ListSingleDoubleExampleState();
}

class _ListSingleDoubleExampleState extends State<ListSingleDoubleExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Single list item (Double)"),
      ),
      body: Column(
        children: [
          SingleListItemSelector<double>(
            items: ListSingleDoubleExample.doubleItems,
            selectedItems: (List<double> selectedItems, _) {
              debugPrint(selectedItems.toString());
            },
            builder: (_, index) {
              return ItemSelector(
                selectedItem: Container(
                  padding: const EdgeInsets.all(15),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    ListSingleDoubleExample.doubleItems[index].toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                unSelectedItem: Container(
                  padding: const EdgeInsets.all(15),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    ListSingleDoubleExample.doubleItems[index].toString(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
