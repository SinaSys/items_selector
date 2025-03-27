import 'package:flutter/material.dart';
import 'package:items_selector/items_selector.dart';

class ListSingleIntExample extends StatelessWidget {
  const ListSingleIntExample({super.key});

  static final List<int> integerItems = [10, 20, 30, 40, 50];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Single list item (Int)",
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleListItemSelector<int>(
              items: integerItems,
              selectedItems: (List<int> selectedItems, _) {
                debugPrint(selectedItems.toString());
              },
              builder: (_, index) {
                return ItemSelector(
                  selectedItem: AnimatedScale(
                    duration: Duration(milliseconds: 300),
                    scale: 1.1,
                    child: Container(
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
                  ),
                  unSelectedItem: AnimatedScale(
                    duration: Duration(milliseconds: 300),
                    scale: 1.0,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.deepOrange.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(integerItems[index].toString()),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: SingleListItemSelector<int>(
              direction: Axis.vertical,
              listConfiguration: ListConfiguration(
                shrinkWrap: true,
              ),
              items: integerItems,
              selectedItems: (List<int> selectedItems, _) {
                debugPrint(selectedItems.toString());
              },
              builder: (_, index) {
                return ItemSelector(
                  selectedItem: AnimatedScale(
                    duration: Duration(milliseconds: 300),
                    scale: 1.1,
                    child: Container(
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
                  ),
                  unSelectedItem: AnimatedScale(
                    duration: Duration(milliseconds: 300),
                    scale: 1.0,
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(10),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.deepOrange.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(integerItems[index].toString()),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
