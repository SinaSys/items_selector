import 'package:flutter/material.dart';
import 'package:items_selector/items_selector.dart';

class WrapMultiDoubleExample extends StatefulWidget {
  const WrapMultiDoubleExample({super.key});

  static final List<double> doubleItems = [10.0, 20.0, 30.0, 40.0, 50.0, 60, 70, 80, 90, 100];

  @override
  State<WrapMultiDoubleExample> createState() => _WrapMultiDoubleExampleState();
}

class _WrapMultiDoubleExampleState extends State<WrapMultiDoubleExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multi wrap item (Double)"),
      ),
      body: Column(
        children: [
          MultiWrapItemSelector<double>(
            // wrapConfiguration: WrapConfiguration(
            // spacing: 10,
            // runSpacing: 20.0,
            // crossAxisAlignment: WrapCrossAlignment.end,
            // alignment: WrapAlignment.center,
            // direction: Axis.vertical,
            // runAlignment: WrapAlignment.end,
            // verticalDirection: VerticalDirection.down,
            // textDirection: TextDirection.ltr,
            //clipBehavior: ,
            //  ),
            items: WrapMultiDoubleExample.doubleItems,
            selectedItems: (List<double> selectedItems, _) {
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
                    WrapMultiDoubleExample.doubleItems[index].toString(),
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
                  child: Text(
                    WrapMultiDoubleExample.doubleItems[index].toString(),
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
