import 'package:flutter/material.dart';
import 'package:example/data/person.dart';
import 'package:items_selector/items_selector.dart';

class WrapSelectorObjectExample extends StatelessWidget {
  const WrapSelectorObjectExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wrap selector Object example"),
      ),
      body: WrapSelector<Person>(
        // options: SingleSelectOptions(), // Or MultiSelectOptions()
        // wrapConfiguration: WrapConfiguration(
        //   spacing: 10,
        //   runSpacing: 20.0,
        //   crossAxisAlignment: WrapCrossAlignment.end,
        //   alignment: WrapAlignment.center,
        //   direction: Axis.vertical,
        //   runAlignment: WrapAlignment.end,
        //   verticalDirection: VerticalDirection.down,
        //   textDirection: TextDirection.ltr,
        // ),
        items: people,
        selectedItems: (List<Person> selectedItems, _) {
          debugPrint(selectedItems.toString());
        },
        builder: (_, index) {
          Person person = people[index];
          return ItemSelector(
            selectedItem: Container(
              margin: EdgeInsets.all(10),
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
            ),
            unSelectedItem: Container(
              margin: EdgeInsets.all(10),
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
