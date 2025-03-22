import 'package:flutter/material.dart';
import 'list_item_selector/multi_item_selector/multi_int_example.dart';
import 'list_item_selector/multi_item_selector/multi_enum_example.dart';
import 'list_item_selector/multi_item_selector/multi_double_example.dart';
import 'list_item_selector/multi_item_selector/multi_object_example.dart';
import 'list_item_selector/multi_item_selector/multi_string_example.dart';
import 'grid_item_selector/multi_item_selector/grid_multi_enum_example.dart';
import 'grid_item_selector/multi_item_selector/grid_multi_double_example.dart';
import 'grid_item_selector/multi_item_selector/grid_multi_object_example.dart';
import 'grid_item_selector/multi_item_selector/grid_multi_string_example.dart';
import 'package:example/grid_item_selector/multi_item_selector/grid_multi_int_example.dart';
import 'package:example/grid_item_selector/single_item_selector/grid_single_int_example.dart';
import 'package:example/grid_item_selector/single_item_selector/grid_single_enum_example.dart';
import 'package:example/list_item_selector/single_item_selector/list_single_int_example.dart';
import 'package:example/list_item_selector/single_item_selector/list_single_enum_example.dart';
import 'package:example/grid_item_selector/single_item_selector/grid_single_double_example.dart';
import 'package:example/grid_item_selector/single_item_selector/grid_single_object_example.dart';
import 'package:example/grid_item_selector/single_item_selector/grid_single_string_example.dart';
import 'package:example/list_item_selector/single_item_selector/list_single_double_example.dart';
import 'package:example/list_item_selector/single_item_selector/list_single_object_example.dart';
import 'package:example/list_item_selector/single_item_selector/list_single_string_example.dart';

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
      // home: SingleObjectExample(),
      home: HomePage(),
    );
  }
}

enum SelectionMode {
  singleList,
  multiList,
  singleGrid,
  multiGrid,
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

    Map<String, Widget> currentSelection = switch (selectionMode) {
      SelectionMode.singleList => singleListRoutes,
      SelectionMode.multiList => multiListRoutes,
      SelectionMode.singleGrid => singleGridRoutes,
      _ => multiGridRoutes,
    };

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListTile(
        onTap: () {
          currentSelection.forEach(
            (key, route) {
              if (title.toLowerCase() == key) {
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
    final List<String> types = ["Int", "Double", "String", "Enum", "Object"];

    return ExpansionPanelList(
      expansionCallback: (int panelIndex, bool isExpanded) {
        this.isExpanded[selectionMode] = isExpanded;
        // switch(selectionMode){
        // SelectionMode.single => ise
        // }
        //  this.isExpanded = isExpanded;
        setState(() {});
      },
      animationDuration: Duration(milliseconds: 500),
      children: [
        ExpansionPanel(
          body: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                for (var item in types) expansionPanelItem(item, selectionMode: selectionMode),
              ],
            ),
          ),
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Container(
              padding: EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              //  padding: EdgeInsets.all(15),
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
                  expansionPanelList("Multi list Item selector", selectionMode: SelectionMode.multiList),
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
                  expansionPanelList("Single grid Item selector", selectionMode: SelectionMode.singleGrid),
                  expansionPanelList("Multi grid Item selector", selectionMode: SelectionMode.multiGrid),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
