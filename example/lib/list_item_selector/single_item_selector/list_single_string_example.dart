import 'package:flutter/material.dart';
import 'package:items_selector/items_selector.dart';

class ListSingleStringExample extends StatelessWidget {
  const ListSingleStringExample({super.key});

  static final List<String> stringItems = ["Android", "Ios"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Single list item (String)"),
      ),
      body: Column(
        children: [
          SingleListItemSelector<String>(
            items: stringItems,
            selectedItems: (List<String> selectedItems, _) {
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
                    stringItems[index].toString(),
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
                  child: Text(stringItems[index].toString()),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
