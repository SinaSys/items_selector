import 'package:flutter/material.dart';
import 'package:items_selector/items_selector.dart';

class RadioSelectorExample extends StatelessWidget {
  const RadioSelectorExample({super.key});

  final TextStyle style = const TextStyle(fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: RadioSelector(
            options: RadioSelectorOption(
              fillColor: WidgetStateProperty.all(Colors.white70),
              spacing: 2.0,
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            items: [
              RadioSelectorItem(
                title: Text("Dart", style: style),
                subtitle: Text(
                  "Client-optimized language used with Flutter",
                  style: style,
                ),
                tileColor: Color(0xFF0175C2),
              ),
              RadioSelectorItem(
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
              RadioSelectorItem(
                title: Text("Swift", style: style),
                subtitle: Text(
                  "Powerful and fast language for iOS apps",
                  style: style,
                ),
                tileColor: Color(0xFFFFAC45),
              ),
              RadioSelectorItem(
                title: Text("Python", style: style),
                subtitle: Text(
                  "High-level language for AI, web, and scripting",
                  style: style,
                ),
                tileColor: Color(0xFF68217A),
              ),
              RadioSelectorItem(
                title: Text("Rust", style: style),
                subtitle: Text(
                  "Memory-safe language for system-level programming",
                  style: style,
                ),
                tileColor: Color(0xFF42B883),
              )
            ],
            selectedItems: (selectedItems, indexes) {
              debugPrint(selectedItems.toString());
              debugPrint(indexes.toString());
            },
          ),
        ),
      ),
    );
  }
}
