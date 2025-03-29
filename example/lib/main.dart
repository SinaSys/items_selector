import 'package:flutter/material.dart';
import 'list_selector/list_selector_int_example.dart';
import 'grid_selector/grid_selector_int_example.dart';
import 'list_selector/list_selector_enum_example.dart';
import 'grid_selector/grid_selector_enum_example.dart';
import 'grid_selector/grid_selector_object_example.dart';
import 'grid_selector/grid_selector_string_example.dart';
import 'list_selector/list_selector_double_example.dart';
import 'list_selector/list_selector_object_example.dart';
import 'list_selector/list_selector_string_example.dart';
import 'package:example/options/multi_option_example.dart';
import 'package:example/options/single_option_example.dart';
import 'package:example/wrap_selector/wrap_selector_int_example.dart';
import 'package:example/wrap_selector/wrap_selector_enum_example.dart';
import 'package:example/grid_selector/grid_selector_double_example.dart';
import 'package:example/wrap_selector/wrap_selector_double_example.dart';
import 'package:example/wrap_selector/wrap_selector_object_example.dart';
import 'package:example/wrap_selector/wrap_selector_string_example.dart';

/// Examples :

/// ================ ListSelector ================
/// Int =>
/// Double =>
/// String =>
/// Enum =>
/// Object =>

/// ================ GridSelector ================
/// Int =>
/// Double =>
/// String =>
/// Enum =>
/// Object =>

/// ================ WrapSelector ================
/// Int =>
/// Double =>
/// String =>
/// Enum =>
/// Object =>

/// ================ Options ================
/// SingleSelectOptions => https://github.com/SinaSys/items_selector/blob/master/example/lib/options/example_single_option.dart
/// MultiSelectOptions => https://github.com/SinaSys/items_selector/blob/master/example/lib/options/example_multi_option.dart

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      home: HomePage(),
    );
  }
}

enum SelectionMode {
  singleList,
  multiList,
  singleGrid,
  multiGrid,
  singleWrap,
  multiWrap,
  singleOption,
  multiOption,
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<SelectionMode, bool> isExpanded = {
    SelectionMode.singleList: false,
    SelectionMode.multiList: false,
    SelectionMode.singleGrid: false,
    SelectionMode.multiGrid: false,
    SelectionMode.singleWrap: false,
    SelectionMode.multiWrap: false,
    SelectionMode.singleOption: false,
    SelectionMode.multiOption: false,
  };

  Widget expansionPanelItem(
    String title, {
    SelectionMode selectionMode = SelectionMode.singleList,
  }) {
    Map<String, Widget> listRoutes = {
      "int": ListSelectorIntExample(),
      "double": ListSelectorDoubleExample(),
      "string": ListSelectorStringExample(),
      "enum": ListSelectorEnumExample(),
      "object": ListSelectorObjectExample(),
    };

    Map<String, Widget> gridRoutes = {
      "int": GridSelectorIntExample(),
      "double": GridSelectorDoubleExample(),
      "string": GridSelectorStringExample(),
      "enum": GridSelectorEnumExample(),
      "object": GridSelectorObjectExample(),
    };

    Map<String, Widget> wrapRoutes = {
      "int": WrapSelectorIntExample(),
      "double": WrapSelectorDoubleExample(),
      "string": WrapSelectorStringExample(),
      "enum": WrapSelectorEnumExample(),
      "object": WrapSelectorObjectExample(),
    };

    Map<String, Widget> singleOptionRoutes = {
      "SingleSelectOption": SingleOptionsExample(),
    };

    Map<String, Widget> multiOptionRoutes = {
      "MultiSelectOption": MultiOptionsExample(),
    };

    Map<String, Widget> currentSelection = switch (selectionMode) {
      SelectionMode.singleList => listRoutes,
      SelectionMode.singleGrid => gridRoutes,
      SelectionMode.singleWrap => wrapRoutes,
      SelectionMode.singleOption => singleOptionRoutes,
      SelectionMode.multiOption => multiOptionRoutes,
      _ => gridRoutes
    };

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListTile(
        onTap: () {
          currentSelection.forEach(
            (key, route) {
              if (title.toLowerCase() == key.toLowerCase()) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return route;
                    },
                  ),
                );
              }
            },
          );
        },
        title: Text(
          title,
          style: TextStyle(
            color: Colors.grey[700],
            // fontSize: 18,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_rounded),
      ),
    );
  }

  Widget expansionPanelList(
    String headerTitle, {
    SelectionMode selectionMode = SelectionMode.singleList,
  }) {
    final List<String> selectors = ["Int", "Double", "String", "Enum", "Object"];

    List<Widget> items = switch (selectionMode) {
      SelectionMode.singleOption => [expansionPanelItem('SingleSelectOption', selectionMode: selectionMode)],
      SelectionMode.multiOption => [expansionPanelItem('MultiSelectOption', selectionMode: selectionMode)],
      _ => selectors.map((selector) => expansionPanelItem(selector, selectionMode: selectionMode)).toList(),
    };

    return ExpansionPanelList(
      expansionCallback: (int panelIndex, bool isExpanded) {
        this.isExpanded[selectionMode] = isExpanded;
        setState(() {});
      },
      animationDuration: Duration(milliseconds: 500),
      children: [
        ExpansionPanel(
          body: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: items,
            ),
          ),
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Container(
              padding: EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                textAlign: TextAlign.start,
                headerTitle,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
          isExpanded: isExpanded[selectionMode]!,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      "List Item selector : ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  expansionPanelList("Examples"),
                ],
              ),
            ),
            SizedBox(height: 15),
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      "Grid Item selector : ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  expansionPanelList(
                    "Examples",
                    selectionMode: SelectionMode.singleGrid,
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      "Wrap Item selector : ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  expansionPanelList(
                    "Examples",
                    selectionMode: SelectionMode.singleWrap,
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      "Options : ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  expansionPanelList(
                    "Single select option",
                    selectionMode: SelectionMode.singleOption,
                  ),
                  expansionPanelList(
                    "Multi select option",
                    selectionMode: SelectionMode.multiOption,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
