import 'package:flutter/material.dart';
import 'package:items_selector/items_selector.dart';

class WrapSelectorStringExample extends StatelessWidget {
  const WrapSelectorStringExample({super.key});

  static final List<String> stringItems = ["Android", "Ios"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wrap selector String example"),
      ),
      body: Column(
        children: [
          WrapSelector<String>(
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
            items: stringItems,
            selectedItems: (List<String> selectedItems, _) {
              debugPrint(selectedItems.toString());
            },
            builder: (_, index) {
              return ItemSelector(
                selectedItem: Container(
                  margin: EdgeInsets.all(10),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    stringItems[index].toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                unSelectedItem: Container(
                  margin: EdgeInsets.all(10),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(stringItems[index].toString()),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
