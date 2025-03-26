import 'package:flutter/material.dart';
import 'package:example/options/multi_option_example.dart';
import 'package:example/options/single_option_example.dart';
import 'list_item_selector/multi_item_selector/multi_int_example.dart';
import 'list_item_selector/multi_item_selector/multi_enum_example.dart';
import 'list_item_selector/multi_item_selector/multi_double_example.dart';
import 'list_item_selector/multi_item_selector/multi_object_example.dart';
import 'list_item_selector/multi_item_selector/multi_string_example.dart';
import 'grid_item_selector/multi_item_selector/grid_multi_enum_example.dart';
import 'grid_item_selector/multi_item_selector/grid_multi_double_example.dart';
import 'grid_item_selector/multi_item_selector/grid_multi_object_example.dart';
import 'grid_item_selector/multi_item_selector/grid_multi_string_example.dart';
import 'package:example/wrap_item_selector/multi_wrap_selector/wrap_multi_int_example.dart';
import 'package:example/grid_item_selector/multi_item_selector/grid_multi_int_example.dart';
import 'package:example/wrap_item_selector/multi_wrap_selector/wrap_multi_enum_example.dart';
import 'package:example/wrap_item_selector/single_wrap_selector/wrap_single_int_example.dart';
import 'package:example/grid_item_selector/single_item_selector/grid_single_int_example.dart';
import 'package:example/list_item_selector/single_item_selector/list_single_int_example.dart';
import 'package:example/wrap_item_selector/multi_wrap_selector/wrap_multi_double_example.dart';
import 'package:example/wrap_item_selector/single_wrap_selector/wrap_single_enum_example.dart';
import 'package:example/grid_item_selector/single_item_selector/grid_single_enum_example.dart';
import 'package:example/wrap_item_selector/multi_wrap_selector/wrap_multi_object_example.dart';
import 'package:example/list_item_selector/single_item_selector/list_single_enum_example.dart';
import 'package:example/wrap_item_selector/multi_wrap_selector/wrap_multi_string_example.dart';
import 'package:example/wrap_item_selector/single_wrap_selector/wrap_single_double_example.dart';
import 'package:example/wrap_item_selector/single_wrap_selector/wrap_single_object_example.dart';
import 'package:example/wrap_item_selector/single_wrap_selector/wrap_single_string_example.dart';
import 'package:example/grid_item_selector/single_item_selector/grid_single_double_example.dart';
import 'package:example/grid_item_selector/single_item_selector/grid_single_object_example.dart';
import 'package:example/grid_item_selector/single_item_selector/grid_single_string_example.dart';
import 'package:example/list_item_selector/single_item_selector/list_single_double_example.dart';
import 'package:example/list_item_selector/single_item_selector/list_single_object_example.dart';
import 'package:example/list_item_selector/single_item_selector/list_single_string_example.dart';

/// Examples :

/// ================ SingleListItemSelector ================
/// Int => https://github.com/SinaSys/items_selector/blob/master/example/lib/list_item_selector/single_item_selector/list_single_int_example.dart
/// Double => https://github.com/SinaSys/items_selector/blob/master/example/lib/list_item_selector/single_item_selector/list_single_double_example.dart
/// String => https://github.com/SinaSys/items_selector/blob/master/example/lib/list_item_selector/single_item_selector/list_single_string_example.dart
/// Enum => https://github.com/SinaSys/items_selector/blob/master/example/lib/list_item_selector/single_item_selector/list_single_enum_example.dart
/// Object => https://github.com/SinaSys/items_selector/blob/master/example/lib/list_item_selector/single_item_selector/list_single_object_example.dart

/// ================ MultiListItemSelector ================
/// Int => https://github.com/SinaSys/items_selector/blob/master/example/lib/list_item_selector/multi_item_selector/multi_int_example.dart
/// Double => https://github.com/SinaSys/items_selector/blob/master/example/lib/list_item_selector/multi_item_selector/multi_double_example.dart
/// String => https://github.com/SinaSys/items_selector/blob/master/example/lib/list_item_selector/multi_item_selector/multi_string_example.dart
/// Enum => https://github.com/SinaSys/items_selector/blob/master/example/lib/list_item_selector/multi_item_selector/multi_enum_example.dart
/// Object => https://github.com/SinaSys/items_selector/blob/master/example/lib/list_item_selector/multi_item_selector/multi_object_example.dart

/// ================ SingleGridItemSelector ================
/// Int => https://github.com/SinaSys/items_selector/blob/master/example/lib/grid_item_selector/single_item_selector/grid_single_int_example.dart
/// Double => https://github.com/SinaSys/items_selector/blob/master/example/lib/grid_item_selector/single_item_selector/grid_single_double_example.dart
/// String => https://github.com/SinaSys/items_selector/blob/master/example/lib/grid_item_selector/single_item_selector/grid_single_string_example.dart
/// Enum => https://github.com/SinaSys/items_selector/blob/master/example/lib/grid_item_selector/single_item_selector/grid_single_enum_example.dart
/// Object => https://github.com/SinaSys/items_selector/blob/master/example/lib/grid_item_selector/single_item_selector/grid_single_object_example.dart

/// ================ SingleWrapItemSelector ================
/// Int => https://github.com/SinaSys/items_selector/blob/master/example/lib/wrap_item_selector/single_wrap_selector/wrap_single_int_example.dart
/// Double => https://github.com/SinaSys/items_selector/blob/master/example/lib/wrap_item_selector/single_wrap_selector/wrap_single_double_example.dart
/// String => https://github.com/SinaSys/items_selector/blob/master/example/lib/wrap_item_selector/single_wrap_selector/wrap_single_string_example.dart
/// Enum => https://github.com/SinaSys/items_selector/blob/master/example/lib/wrap_item_selector/single_wrap_selector/wrap_single_enum_example.dart
/// Object => https://github.com/SinaSys/items_selector/blob/master/example/lib/wrap_item_selector/single_wrap_selector/wrap_single_object_example.dart

/// ================ MultiWrapItemSelector ================
/// Int => https://github.com/SinaSys/items_selector/blob/master/example/lib/wrap_item_selector/single_wrap_selector/wrap_single_int_example.dart
/// Double => https://github.com/SinaSys/items_selector/blob/master/example/lib/wrap_item_selector/single_wrap_selector/wrap_single_double_example.dart
/// String => https://github.com/SinaSys/items_selector/blob/master/example/lib/wrap_item_selector/single_wrap_selector/wrap_single_string_example.dart
/// Enum => https://github.com/SinaSys/items_selector/blob/master/example/lib/wrap_item_selector/single_wrap_selector/wrap_single_enum_example.dart
/// Object => https://github.com/SinaSys/items_selector/blob/master/example/lib/wrap_item_selector/single_wrap_selector/wrap_single_object_example.dart

/// ================ MultiGridItemSelector ================
/// Int => https://github.com/SinaSys/items_selector/blob/master/example/lib/grid_item_selector/multi_item_selector/grid_multi_int_example.dart
/// Double => https://github.com/SinaSys/items_selector/blob/master/example/lib/grid_item_selector/multi_item_selector/grid_multi_double_example.dart
/// String => https://github.com/SinaSys/items_selector/blob/master/example/lib/grid_item_selector/multi_item_selector/grid_multi_string_example.dart
/// Enum => https://github.com/SinaSys/items_selector/blob/master/example/lib/grid_item_selector/multi_item_selector/grid_multi_enum_example.dart
/// Object => https://github.com/SinaSys/items_selector/blob/master/example/lib/grid_item_selector/multi_item_selector/grid_multi_object_example.dart

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
    Map<String, Widget> singleListRoutes = {
      "int": ListSingleIntExample(),
      "double": ListSingleDoubleExample(),
      "string": ListSingleStringExample(),
      "enum": ListSingleEnumExample(),
      "object": ListSingleObjectExample(),
    };

    Map<String, Widget> multiListRoutes = {
      "int": MultiIntExample(),
      "double": MultiDoubleExample(),
      "string": MultiStringExample(),
      "enum": MultiEnumExample(),
      "object": MultiObjectExample(),
    };

    Map<String, Widget> singleGridRoutes = {
      "int": GridSingleIntExample(),
      "double": GridSingleDoubleExample(),
      "string": GridSingleStringExample(),
      "enum": GridSingleEnumExample(),
      "object": GridSingleObjectExample(),
    };

    Map<String, Widget> multiGridRoutes = {
      "int": GridMultiIntExample(),
      "double": GridMultiDoubleExample(),
      "string": GridMultiStringExample(),
      "enum": GridMultiEnumExample(),
      "object": GridMultiObjectExample(),
    };

    Map<String, Widget> singleWrapRoutes = {
      "int": WrapSingleIntExample(),
      "double": WrapSingleDoubleExample(),
      "string": WrapSingleStringExample(),
      "enum": WrapSingleEnumExample(),
      "object": WrapSingleObjectExample(),
    };

    Map<String, Widget> multiWrapRoutes = {
      "int": WrapMultiIntExample(),
      "double": WrapMultiDoubleExample(),
      "string": WrapMultiStringExample(),
      "enum": WrapMultiEnumExample(),
      "object": WrapMultiObjectExample(),
    };

    Map<String, Widget> singleOptionRoutes = {
      "SingleSelectOption": SingleOptionsExample(),
    };

    Map<String, Widget> multiOptionRoutes = {
      "MultiSelectOption": MultiOptionsExample(),
    };

    Map<String, Widget> currentSelection = switch (selectionMode) {
      SelectionMode.singleList => singleListRoutes,
      SelectionMode.multiList => multiListRoutes,
      SelectionMode.singleGrid => singleGridRoutes,
      SelectionMode.singleWrap => singleWrapRoutes,
      SelectionMode.multiWrap => multiWrapRoutes,
      SelectionMode.singleOption => singleOptionRoutes,
      SelectionMode.multiOption => multiOptionRoutes,
      _ => multiGridRoutes,
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
    final List<String> options = ["SingleSelectOption", "MultiSelectOption"];

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
                  expansionPanelList("Single list Item selector"),
                  expansionPanelList(
                    "Multi list Item selector",
                    selectionMode: SelectionMode.multiList,
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
                      "Grid Item selector : ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  expansionPanelList(
                    "Single grid Item selector",
                    selectionMode: SelectionMode.singleGrid,
                  ),
                  expansionPanelList(
                    "Multi grid Item selector",
                    selectionMode: SelectionMode.multiGrid,
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
                    "Single wrap Item selector",
                    selectionMode: SelectionMode.singleWrap,
                  ),
                  expansionPanelList(
                    "Multi wrap Item selector",
                    selectionMode: SelectionMode.multiWrap,
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
