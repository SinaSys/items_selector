import 'package:flutter/material.dart';
import 'package:example/model/person.dart';
import 'package:items_selector/items_selector.dart';

class GridSelectorObjectExample extends StatelessWidget {
  const GridSelectorObjectExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Single grid item (Object)"),
      ),
      body: GridSelector<Person>.builder(
        builderConfiguration: BuilderConfiguration(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 130.0,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
            mainAxisExtent: 200,
          ),
        ),
        items: people,
        selectedItems: (List<Person> selectedItems, _) {
          debugPrint(selectedItems.toString());
        },
        builder: (_, index) {
          Person person = people[index];
          return ItemSelector(
            selectedItem: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    person.fullName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Age : ${person.age}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  switch (person.gender.name) {
                    "male" => Image.asset(
                        "assets/images/male.png",
                        height: 60,
                      ),
                    _ => Image.asset(
                        "assets/images/female.png",
                        height: 60,
                      )
                  },
                ],
              ),
            ),
            unSelectedItem: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.deepOrange.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 10,
                children: [
                  Text(person.fullName, textAlign: TextAlign.center),
                  Text("Age : ${person.age}"),
                  switch (person.gender.name) {
                    "male" => Image.asset("assets/images/male.png", height: 40),
                    _ => Image.asset("assets/images/female.png", height: 40)
                  },
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
