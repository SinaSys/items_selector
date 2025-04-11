import 'package:flutter/material.dart';
import 'package:example/data/person.dart';
import 'package:items_selector/items_selector.dart';

class ListSelectorObjectExample extends StatelessWidget {
  const ListSelectorObjectExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List selector Object example"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("ListSelector.Builder"),
            Text("Single select"),
            SizedBox(
              height: 220,
              child: ListSelector<Person>.builder(
                direction: Axis.horizontal,
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
            ),
            SizedBox(height: 20),
            Text("ListSelector.separated"),
            Text("Multi select"),
            SizedBox(
              height: 220,
              child: ListSelector<Person>.separated(
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
                direction: Axis.horizontal,
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
            ),
          ],
        ),
      ),
    );
  }
}
