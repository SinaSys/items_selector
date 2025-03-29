import 'package:flutter/material.dart';
import 'package:items_selector/items_selector.dart';

enum Language {
  dart,
  kotlin,
  java,
  python,
  ruby,
  rust,
}

class GridSelectorEnumExample extends StatelessWidget {
  const GridSelectorEnumExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grid Selector item (Enum)"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(" GridSelector.builder"),
            Text("Single select"),
            GridSelector<Language>.builder(
              options: SingleSelectOptions(),
              builderConfiguration: BuilderConfiguration(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 120.0,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                shrinkWrap: true,
              ),
              items: Language.values,
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
                      Language.values[index].name,
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
                    child: Text(Language.values[index].name),
                  ),
                );
              },
            ),
            Text(" GridSelector.count"),
            Text("Multi select"),
            GridSelector<Language>.count(
              countConfiguration: CountConfiguration(
                crossAxisCount: 3,
                shrinkWrap: true,
              ),
              options: MultiSelectOptions(),
              items: Language.values,
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
                      Language.values[index].name,
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
                    child: Text(Language.values[index].name),
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
