import 'package:flutter/material.dart';
import 'package:items_selector/items_selector.dart';

class MultiOptionsExample extends StatelessWidget {
  const MultiOptionsExample({super.key});

  static final List<int> integerItems = [10, 20, 30, 40, 50];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multi Options (Int)"),
      ),
      body: Column(
        children: [
          /// 1
          SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Items : [10,20,30,40,50]",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "|",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Initial items : [10,20]",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "maxItems : 3",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Initial items : [10,]",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.transparent),
                  ),
                ],
              )
            ],
          ),
          MultiListItemSelector<int>(
            items: integerItems,
            initialItems: [10, 20],
            options: MultiSelectOptions(
              allowUnselectInitialItems: true,
              maxItems: 3,
            ),
            selectedItems: (List<int> selectedItems, _) {
              debugPrint(selectedItems.toString());
            },
            builder: (_, index) {
              return ItemSelector(
                selectedItem: AnimatedScale(
                  duration: Duration(milliseconds: 300),
                  scale: 1.1,
                  child: Container(
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

          /// 2
          SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Items : [10,20,30,40,50]",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "|",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Initial items : [10,20]",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "maxItems : 4",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Initial items : [10,]",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.transparent),
                  ),
                ],
              )
            ],
          ),
          MultiListItemSelector<int>(
            items: integerItems,
            initialItems: [10, 20],
            options: MultiSelectOptions(
              allowUnselectInitialItems: false,
              maxItems: 4,
            ),
            selectedItems: (List<int> selectedItems, _) {
              debugPrint(selectedItems.toString());
            },
            builder: (_, index) {
              return ItemSelector(
                selectedItem: AnimatedScale(
                  duration: Duration(milliseconds: 300),
                  scale: 1.1,
                  child: Container(
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

          /// 3
          SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Items : [10,20,30,40,50]",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "|",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Initial items : null",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "maxItems : 3",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Initial item",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.transparent),
                  ),
                ],
              )
            ],
          ),
          MultiListItemSelector<int>(
            items: integerItems,
            options: MultiSelectOptions(
              allowUnselectInitialItems: false,
              maxItems: 3,
            ),
            selectedItems: (List<int> selectedItems, _) {
              debugPrint(selectedItems.toString());
            },
            builder: (_, index) {
              return ItemSelector(
                selectedItem: AnimatedScale(
                  duration: Duration(milliseconds: 300),
                  scale: 1.1,
                  child: Container(
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

          /// 4
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Items : [10,20,30,40,50]",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "|",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Initial items :[10,20]",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
              ),
            ],
          ),
          MultiListItemSelector<int>(
            items: integerItems,
            initialItems: [10, 20],
            options: MultiSelectOptions(
              allowUnselectInitialItems: true,
            ),
            selectedItems: (List<int> selectedItems, _) {
              debugPrint(selectedItems.toString());
            },
            builder: (_, index) {
              return ItemSelector(
                selectedItem: AnimatedScale(
                  duration: Duration(milliseconds: 300),
                  scale: 1.1,
                  child: Container(
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

          /// 5
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Items : [10,20,30,40,50]",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "|",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Initial items : [10,20]",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
              ),
            ],
          ),
          MultiListItemSelector<int>(
            items: integerItems,
            initialItems: [10, 20],
            options: MultiSelectOptions(
              allowUnselectInitialItems: false,
            ),
            selectedItems: (List<int> selectedItems, _) {
              debugPrint(selectedItems.toString());
            },
            builder: (_, index) {
              return ItemSelector(
                selectedItem: AnimatedScale(
                  duration: Duration(milliseconds: 300),
                  scale: 1.1,
                  child: Container(
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

          /// 6
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Items : [10,20,30,40,50]",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "|",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Initial items : null",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
              ),
            ],
          ),
          MultiListItemSelector<int>(
            items: integerItems,
            options: MultiSelectOptions(
              allowUnselectInitialItems: false,
            ),
            selectedItems: (List<int> selectedItems, _) {
              debugPrint(selectedItems.toString());
            },
            builder: (_, index) {
              return ItemSelector(
                selectedItem: AnimatedScale(
                  duration: Duration(milliseconds: 300),
                  scale: 1.1,
                  child: Container(
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
        ],
      ),
    );
  }
}
