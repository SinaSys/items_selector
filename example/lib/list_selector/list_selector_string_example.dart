import 'package:flutter/material.dart';
import 'package:items_selector/items_selector.dart';

class ListSelectorStringExample extends StatelessWidget {
  const ListSelectorStringExample({super.key});

  static final List<String> stringItems = ["Flutter", "Compose", "Xamarin", "Ionic", "MAUI"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List selector string example"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10, width: double.infinity),
            Text("ListSelector.Builder"),
            Text("Single select"),
            SizedBox(
              height: 100,
              child: ListSelector<String>.builder(
                listConfiguration: ListConfiguration(
                  shrinkWrap: true,
                ),
                direction: Axis.horizontal,
                items: stringItems,
                selectedItems: (List<String> selectedItems, _) {
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
                          stringItems[index],
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
                        child: Text(stringItems[index]),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text("ListSelector.separated"),
            Text("Multi select"),
            SizedBox(
              height: 100,
              child: ListSelector<String>.separated(
                options: MultiSelectOptions(),
                separatorBuilder: (_, index) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: VerticalDivider(
                        width: 10,
                        thickness: 2,
                      ),
                    ),
                  );
                },
                listConfiguration: ListConfiguration(
                  shrinkWrap: true,
                ),
                direction: Axis.horizontal,
                items: stringItems,
                selectedItems: (List<String> selectedItems, _) {
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
                          stringItems[index],
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
                        child: Text(stringItems[index]),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
