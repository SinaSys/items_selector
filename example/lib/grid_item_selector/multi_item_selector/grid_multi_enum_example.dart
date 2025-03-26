import 'package:flutter/material.dart';
import 'package:items_selector/items_selector.dart';

enum Language {
  dart,
  kotlin,
  java,
}

class GridMultiEnumExample extends StatelessWidget {
  const GridMultiEnumExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multi list item (Enum)"),
      ),
      body: MultiGridItemSelector<Language>(
        items: Language.values,
        gridConfiguration: GridConfiguration(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 130.0,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
          ),
        ),
        selectedItems: (List<Language> selectedItems, _) {
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
                Language.values[index].name.toString(),
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
              child: Text(Language.values[index].name.toString()),
            ),
          );
        },
      ),
    );
  }
}
