import 'package:flutter/material.dart';
import 'package:example/model/person.dart';
import 'package:items_selector/items_selector.dart';

class ListSingleObjectExample extends StatelessWidget {
  const ListSingleObjectExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Single list item (Object)"),
      ),
      body: SingleListItemSelector<Person>(
        direction: Axis.vertical,
        items: people,
        selectedItems: (List<Person> selectedItems, _) {
          debugPrint(selectedItems.toString());
        },
        builder: (_, index) {
          Person person = people[index];
          return ItemSelector(
            selectedItem: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: Text(
                  person.fullName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Age : ${person.age}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: switch (person.gender.name) {
                  "male" => Image.asset("assets/images/male.png"),
                  _ => Image.asset("assets/images/female.png")
                },
              ),
              // child: Text(
              //   integerItems[index].toString(),
              //   style: const TextStyle(
              //     color: Colors.white,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
            ),
            unSelectedItem: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.deepOrange.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: Text(person.fullName),
                subtitle: Text("Age : ${person.age}"),
                trailing: switch (person.gender.name) {
                  "male" => Image.asset("assets/images/male.png"),
                  _ => Image.asset("assets/images/female.png")
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
