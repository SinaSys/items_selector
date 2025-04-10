import 'package:flutter/material.dart';
import 'package:items_selector/items_selector.dart';

class WrapSelectorIntExample extends StatelessWidget {
  const WrapSelectorIntExample({super.key});

  static final List<int> integerItems = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wrap selector Int example"),
      ),
      body: SizedBox(
        height: 200,
        child: WrapSelector<int>(
          items: integerItems,
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
      ),
    );
  }
}
