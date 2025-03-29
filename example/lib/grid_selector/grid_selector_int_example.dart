import 'package:flutter/material.dart';
import 'package:items_selector/items_selector.dart';

class GridSelectorIntExample extends StatelessWidget {
  const GridSelectorIntExample({super.key});

  static final List<int> integerItems = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grid selector item (Int)"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(" GridSelector.builder"),
            Text("Single select"),
            GridSelector<int>.builder(
              options: SingleSelectOptions(),
              builderConfiguration: BuilderConfiguration(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 120.0,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                shrinkWrap: true,
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
            ),
            Text(" GridSelector.count"),
            Text("Multi select"),
            GridSelector<int>.count(
              countConfiguration: CountConfiguration(
                crossAxisCount: 3,
                shrinkWrap: true,
              ),
              options: MultiSelectOptions(),
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
            ),
          ],
        ),
      ),
    );
  }
}
