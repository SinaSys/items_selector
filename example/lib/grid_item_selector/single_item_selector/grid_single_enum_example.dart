import 'package:flutter/material.dart';
import 'package:items_selector/items_selector.dart';

enum Language {
  dart,
  kotlin,
  java,
}

class GridSingleEnumExample extends StatelessWidget {
  const GridSingleEnumExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Single grid item (Enum)"),
      ),
      body: SingleGridItemSelector<Language>(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 130.0,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
        ),
        items: Language.values,
        selectedItems: (List<Language> selectedItems, _) {
          debugPrint(selectedItems.toString());
        },
        builder: (_, index) {
          return ItemSelector(
            selectedItem: Container(
              alignment: Alignment.center,
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
