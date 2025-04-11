import 'package:flutter/material.dart';
import 'package:items_selector/items_selector.dart';

class CheckboxSelectorExample extends StatelessWidget {
  const CheckboxSelectorExample({super.key});

  final TextStyle style = const TextStyle(fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CheckBoxSelector(
        initialItems: [3,4],
        selectedItems: (selectedItems, indexes) {
          debugPrint(selectedItems.toString());
          debugPrint(indexes.toString());
        },
        options: CheckBoxSelectorOption(
          mainAxisAlignment: MainAxisAlignment.center,
          controlAffinity: ListTileControlAffinity.leading,
          fillColor: WidgetStateProperty.all(Colors.black26),
        ),
        items: [
          CheckBoxSelectorItem(
            title: Text("Dart", style: style),
            subtitle: Text(
              "Client-optimized language used with Flutter",
              style: style,
            ),
            tileColor: Color(0xFF0175C2),
          ),
          CheckBoxSelectorItem(
            title: Text("Kotlin", style: style),
            subtitle: Text(
              "Modern language for Android development",
              style: style,
            ),
            tileColor: Color(0xFFFF5722),
            secondary: Icon(
              Icons.android,
              color: Colors.white,
            ),
          ),
          CheckBoxSelectorItem(
            title: Text("Swift", style: style),
            subtitle: Text(
              "Powerful and fast language for iOS apps",
              style: style,
            ),
            tileColor: Color(0xFFFFAC45),
          ),
          CheckBoxSelectorItem(
            title: Text("Python", style: style),
            subtitle: Text(
              "High-level language for AI, web, and scripting",
              style: style,
            ),
            tileColor: Color(0xFF68217A),
          ),
          CheckBoxSelectorItem(
            title: Text("Rust", style: style),
            subtitle: Text(
              "Memory-safe language for system-level programming",
              style: style,
            ),
            tileColor: Color(0xFF42B883),
          )
        ],
      ),
    );
  }
}
