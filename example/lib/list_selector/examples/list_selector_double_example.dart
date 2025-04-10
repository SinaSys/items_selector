import 'package:flutter/material.dart';
import 'package:items_selector/items_selector.dart';

class ListSelectorDoubleExample extends StatelessWidget {
  const ListSelectorDoubleExample({super.key});

  static final List<double> doubleItems = [10.0, 20.0, 30.0, 40.0, 50.0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List selector double example"),
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
              child: ListSelector<double>(
                  direction: Axis.horizontal,
                  flexConfiguration: FlexConfiguration(
                    spacing: 10.0,
                  ),
                  options: MultiSelectOptions(),
                  items: doubleItems,
                  selectedItems: (List<double> selectedItems, _) {
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
                            doubleItems[index].toString(),
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
                          child: Text(doubleItems[index].toString()),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(height: 20),
            Text("Single select"),
            Text("ListSelector.Builder"),
            Text("Single select"),
            SizedBox(
              height: 100,
              child: ListSelector<double>.builder(
                listConfiguration: ListConfiguration(
                  shrinkWrap: true,
                ),
                direction: Axis.horizontal,
                items: doubleItems,
                selectedItems: (List<double> selectedItems, _) {
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
                          doubleItems[index].toString(),
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
                        child: Text(doubleItems[index].toString()),
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
              child: ListSelector<double>.separated(
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
                items: doubleItems,
                selectedItems: (List<double> selectedItems, _) {
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
                          doubleItems[index].toString(),
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
                        child: Text(doubleItems[index].toString()),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Text("ListSelector.wheel()"),
            Text("Multi select"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: SizedBox(
                height: 200,
                child: ListSelector<double>.wheel(
                    wheelConfiguration: WheelConfiguration(
                      itemExtent: 60,
                      diameterRatio: 3.0,
                      perspective: 0.01,
                    ),
                    options: MultiSelectOptions(),
                    items: doubleItems,
                    selectedItems: (List<double> selectedItems, _) {
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
                            doubleItems[index].toString(),
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
                          child: Text(doubleItems[index].toString()),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
