import 'package:flutter/material.dart';
import 'package:items_selector/items_selector.dart';

enum Language {
  dart,
  kotlin,
  java,
  ruby,
  rust,
  python,
}

class ListSelectorEnumExample extends StatelessWidget {
  const ListSelectorEnumExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List selector Enum example"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10, width: double.infinity),
            Text("ListSelector() Column"),
            Text("Multi select"),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListSelector(
                  direction: Axis.vertical,
                  flexConfiguration: FlexConfiguration(
                    spacing: 5.0,
                  ),
                  options: MultiSelectOptions(),
                  items: Language.values,
                  selectedItems: (List<Language> selectedItems, _) {
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
                            Language.values[index].name.toString(),
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
                          child: Text(Language.values[index].name),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(height: 20),
            Text("ListSelector.Builder"),
            Text("Single select"),
            SizedBox(
              height: 100,
              child: ListSelector<Language>.builder(
                listConfiguration: ListConfiguration(
                  shrinkWrap: true,
                ),
                direction: Axis.horizontal,
                items: Language.values,
                selectedItems: (List<Language> selectedItems, _) {
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
                          Language.values[index].name.toString(),
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
                        child: Text(Language.values[index].name.toString()),
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
              child: ListSelector<Language>.separated(
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
                items: Language.values,
                selectedItems: (List<Language> selectedItems, _) {
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
                          Language.values[index].name.toString(),
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
                        child: Text(Language.values[index].name.toString()),
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
                child: ListSelector<Language>.wheel(
                    wheelConfiguration: WheelConfiguration(
                      itemExtent: 60,
                      diameterRatio: 3.0,
                      perspective: 0.01,
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
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.deepOrange.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(Language.values[index].name),
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
