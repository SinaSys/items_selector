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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleListItemSelector<String>(
              items: stringItems,
              selectedItems: (List<String> selectedItems, _) {
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
                      stringItems[index].toString(),
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
                    child: Text(stringItems[index].toString()),
                  ),
                );
              },
            ),
          ),
          SingleListItemSelector<String>(
            direction: Axis.vertical,
            listConfiguration: ListConfiguration(
              shrinkWrap: true,
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
          )
        ],
      ),
    );
  }
}
