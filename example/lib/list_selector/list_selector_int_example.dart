import 'package:flutter/material.dart';
import 'package:items_selector/items_selector.dart';

class ListSelectorIntExample extends StatelessWidget {
  const ListSelectorIntExample({super.key});

  static final List<int> integerItems = [10, 20, 30, 40, 50];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List selector int example"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10, width: double.infinity),
            Text("ListSelector() Row"),
            Text("Multi select"),
            SizedBox(height: 5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ListSelector<int>(
                  direction: Axis.horizontal,
                  flexConfiguration: FlexConfiguration(
                    spacing: 10.0,
                  ),
                  options: MultiSelectOptions(),
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
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.deepOrange.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(integerItems[index].toString()),
                        ),
                      ),
                    );
                  }),
            ),
            Text("ListSelector.Builder"),
            Text("Single select"),
            SizedBox(
              height: 100,
              child: ListSelector<int>.builder(
                listConfiguration: ListConfiguration(
                  shrinkWrap: true,
                ),
                direction: Axis.horizontal,
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
            ),
            SizedBox(height: 20),
            Text("ListSelector.separated"),
            Text("Multi select"),

            SizedBox(
              height: 100,
              child: ListSelector<int>.separated(
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
      ),
    );
  }
}


