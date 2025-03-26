import 'package:flutter/material.dart';
import 'package:items_selector/items_selector.dart';

enum Language {
  dart,
  kotlin,
  java,
}

class MultiEnumExample extends StatelessWidget {
  const MultiEnumExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multi list item (Enum)"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: MultiListItemSelector<Language>(
          items: Language.values,
          selectedItems: (List<Language> selectedItems, _) {
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
                  Language.values[index].name.toString(),
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
                child: Text(Language.values[index].name.toString()),
              ),
            );
          },
        ),
      ),
    );
  }
}
