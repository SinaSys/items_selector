import 'package:flutter/material.dart';
import 'package:items_selector/items_selector.dart';

class GridSelectorStringExample extends StatelessWidget {
  const GridSelectorStringExample({super.key});

  static final List<String> stringItems = ["Flutter", "Compose", "Xamarin", "Ionic", "MAUI"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Single grid item (String)"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridSelector<String>.builder(
              options: SingleSelectOptions(),
              builderConfiguration: BuilderConfiguration(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 120.0,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
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
                    child: FittedBox(
                      child: Text(
                        stringItems[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
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
                    child: FittedBox(child: Text(stringItems[index])),
                  ),
                );
              },
            ),
            GridSelector<String>.count(
              countConfiguration: CountConfiguration(
                crossAxisCount: 3,
                shrinkWrap: true,
              ),
              options: MultiSelectOptions(),
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
                      stringItems[index],
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
                    child: Text(stringItems[index]),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
