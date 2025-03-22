
# Items Selector 

<p align="center">
  <img src="https://github.com/SinaSys/items_selector/blob/images/assets/images/other/main_image.png?raw=true" alt="Group 7">
</p>

<br>

# Introduction 
This package provides a flexible and customizable solution for selecting items from a list. It supports both single and multi-selection modes, as well as the ability to define initial items (either fixed and non-selectable or selectable). The package offers versatile display options, including scrollable lists (horizontally or vertically) and grid views. Additionally, it is fully generic and supports all data types, making it adaptable to various use cases.


<br>


# Features  
-  Supports all primitive data types (e.g., int, String, etc.), enums, and custom classes. 
-  Built-in state management handled by the package.
-  Provides both single-select and multi-select options. 
-  Fully customizable widgets for selected and unselected states.
-  Displays scrollable lists horizontally or vertically. 
-  Supports grid view layouts. 
-  Ability to define initial items (selectable or non-selectable).
-  Animation support


<br>


# How to use 
In a terminal, located at the root of your package, run this command:
```dart
flutter pub add items_selector
```


<br>

# Options
## SingleSelectOption
`SingleSelectOption` is used within the `SingleListItemSelector` and `SingleGridItemSelector` widgets and includes two boolean properties: `allowUnselectedInitialItem` and `allowUnselectedMainItem`. When the `initialItem` property is set, enabling `allowUnselectedInitialItem` makes those initial items unselectable. Similarly, enabling `allowUnselectedMainItem` prevents the main items from being selected.


| Row | Initial Items | Main Items | Allow Unselect Main Item | Allow Unselect Initial Item | Image/Description | URL |
|:---:|:------------:|:---------:|:-----------------------:|:--------------------------:|:-----------------:|:---:|
| 1  | Y | Y | Y | Y | ![1](https://github.com/SinaSys/items_selector/blob/images/assets/images/options/single/1.gif?raw=true) | URL Link |
| 5  | Y | Y | Y | N | ![2](https://github.com/SinaSys/items_selector/blob/images/assets/images/options/single/2.gif?raw=true) | URL Link |
| 9  | Y | Y | N | Y | ![3](https://github.com/SinaSys/items_selector/blob/images/assets/images/options/single/3.gif?raw=true) | URL Link |
| 13 | Y | Y | N | N | ![4](https://github.com/SinaSys/items_selector/blob/images/assets/images/options/single/4.gif?raw=true) | URL Link |
| 14 | N | Y | N | N | ![5](https://github.com/SinaSys/items_selector/blob/images/assets/images/options/single/5.gif?raw=true) | URL Link |

<br>

## MultiSelectOption
`MultiSelectOption` is used within the `MultiListItemSelector` and `MultiGridItemSelector` widgets and includes two properties: `allowUnselectedInitialItem` and `maxItems`. When the `initialItems` property is set, enabling `allowUnselectedInitialItem` makes those initial items unselectable. The `maxItems` property defines the maximum number of items that can be selected.

| Row | Initial Items | Main Item | Allow Unselect Initial Item | Max Count | Image | URL |
|:---:|:------------:|:--------:|:----------------------:|:---------:|:-----:|:---:|
| 1  | Y | Y | Y | Y | ![6](https://github.com/SinaSys/items_selector/blob/images/assets/images/options/multi/1.gif?raw=true) | URL |
| 5  | Y | Y | N | Y | ![5](https://github.com/SinaSys/items_selector/blob/images/assets/images/options/multi/2.gif?raw=true) | URL |
| 6  | N | Y | N | Y | ![4](https://github.com/SinaSys/items_selector/blob/images/assets/images/options/multi/3.gif?raw=true) | URL |
| 9  | Y | Y | Y | N | ![3](https://github.com/SinaSys/items_selector/blob/images/assets/images/options/multi/4.gif?raw=true) | URL |
| 13 | Y | Y | N | N | ![2](https://github.com/SinaSys/items_selector/blob/images/assets/images/options/multi/5.gif?raw=true) | URL |
| 14 | N | Y | N | N | ![1](https://github.com/SinaSys/items_selector/blob/images/assets/images/options/multi/6.gif?raw=true) | URL |

<br>



# Widgets
The `SingleListItemSelector`, `SingleGridItemSelector`, `MultiListItemSelector`, and `MultiGridItemSelector` widgets provide a flexible solution for selecting items from a collection, supporting both single and multi-selection modes. They require three main properties: `items`, `builder`, and `selectedItems`. The `items` property defines the available list of items, while the `builder` function is used to create custom widgets for selected and unselected states through the `selectedItem` and `unSelectedItem` properties. The `selectedItems` callback returns the list of selected items whenever a selection is made. Additionally, the optional `initialItems` property allows specifying pre-selected items at initialization. Selection behavior can be further customized using selection options specific to each widget type: `SingleListItemSelector` and `SingleGridItemSelector` use `SingleSelectOptions`, which includes properties like `allowUnselectInitialItem` and `allowUnselectMainItem` to control selection behavior, while `MultiListItemSelector` and `MultiGridItemSelector` use `MultiSelectOptions`, which provides `allowUnselectInitialItem` to determine whether initial items can be unselected and `maxItems` to set a selection limit. The key difference among these widgets is their layout: `SingleListItemSelector` and `MultiListItemSelector` arrange items in a horizontal or vertical list using `ListView`, whereas `SingleGridItemSelector` and `MultiGridItemSelector` display items in a grid format using `GridView`.


<br>


## SingleListItemSelector 


#### SingleListItemSelector (Primitive types)

```dart
       SingleListItemSelector<int>(
            items: integerItems,
            selectedItems: (List<int> selectedItems,_) {
              debugPrint(selectedItems.toString());
            },
            builder: (_, index) {
              return ItemSelector(
                selectedItem: yourDesireWidget(),
                unSelectedItem:yourDesireWidget() ,
              );
            },
          ),
```

<p align="center">
  <img src="https://github.com/SinaSys/items_selector/blob/images/assets/images/widgets/single_list_item/primitive.gif?raw=true">
</p>


<br>

#### SingleListItemSelector (Enums)
```dart
          SingleListItemSelector<Language>(
            items: Language.values,
            selectedItems: (List<Language> selectedItems,_) {
              debugPrint(selectedItems.toString());
            },
            builder: (_, index) {
              return ItemSelector(
                selectedItem: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    Language.values[index].name.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                unSelectedItem: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(Language.values[index].name.toString()),
                ),
              );
            },
          )

```

<p align="center">
  <img src="https://github.com/SinaSys/items_selector/blob/images/assets/images/widgets/single_list_item/enums.gif?raw=true">
</p>


<br>

#### SingleListItemSelector (Custom classes)

```dart
           SingleListItemSelector<Person>(
            direction: Axis.vertical,
            items: people,
            selectedItems: (List<Person> selectedItems, _) {
              debugPrint(selectedItems.toString());
            },
            builder: (_, index) {
              Person person = people[index];
              return ItemSelector(
                selectedItem: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(
                      person.fullName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "Age : ${person.age}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: switch (person.gender.name) {
                      "male" => Image.asset("assets/images/male.png"),
                      _ => Image.asset("assets/images/female.png")
                    },
                  ),
                ),
                unSelectedItem: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(person.fullName),
                    subtitle: Text("Age : ${person.age}"),
                    trailing: switch (person.gender.name) {
                      "male" => Image.asset("assets/images/male.png"),
                      _ => Image.asset("assets/images/female.png")
                    },
                  ),
                ),
              );
            },
          )

```

<p align="center">
  <img src="https://github.com/SinaSys/items_selector/blob/images/assets/images/widgets/single_list_item/class.gif?raw=true">
</p>

<br>
<br>
<br>


## SingleGridItemSelector

### SingleGridItemSelector (Primitive types)

```dart
   SingleGridItemSelector<double>(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 130.0,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
        ),
        items: doubleItems,
        selectedItems: (List<double> selectedItems,_) {
          debugPrint(selectedItems.toString());
        },
        builder: (_, index) {
          return ItemSelector(
            selectedItem: yourDesireWidget(),
            unSelectedItem: yourDesireWidget,
          );
        },
      )

```
<p align="center">
  <img src="https://github.com/SinaSys/items_selector/blob/images/assets/images/widgets/single_grid_item/primitive.gif?raw=true">
</p>

<br>


### SingleGridItemSelector (Enums)

```dart
 SingleGridItemSelector<Language>(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 130.0,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
        ),
        items: Language.values,
        selectedItems: (List<Language> selectedItems, _) {
          debugPrint(selectedItems.toString());
        },
        builder: (_, index) {
          return ItemSelector(
            selectedItem: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                Language.values[index].name.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            unSelectedItem: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.deepOrange.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(Language.values[index].name.toString()),
            ),
          );
        },
      )

```

<p align="center">
  <img src="https://github.com/SinaSys/items_selector/blob/images/assets/images/widgets/single_grid_item/enums.gif?raw=true">
</p>


<br>



### SingleGridItemSelector (Custom classes)

```dart
 SingleGridItemSelector<Person>(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 170.0,
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 2.0,
          mainAxisExtent: 200,
        ),
        items: people,
        selectedItems: (List<Person> selectedItems, _) {
          debugPrint(selectedItems.toString());
        },
        builder: (_, index) {
          Person person = people[index];
          return ItemSelector(
            selectedItem: Container(
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
      )

```

<p align="center">
  <img src="https://github.com/SinaSys/items_selector/blob/images/assets/images/widgets/single_grid_item/class.gif?raw=true">
</p>

<br>
<br>
<br>


## MultiListItemSelector 
#### MultiListItemSelector (Primitive types)

```dart
          MultiListItemSelector<String>(
            items: stringItems,
            selectedItems: (List<String> selectedItems,_) {
              debugPrint(selectedItems.toString());
            },
            builder: (_, index) {
              return ItemSelector(
                selectedItem: yourDesireWidget(),
                unSelectedItem: yourDesireWidget(),
              );
            },
          )
```

<p align="center">
  <img src="https://github.com/SinaSys/items_selector/blob/images/assets/images/widgets/multi_list_item/primitive.gif?raw=true">
</p>

<br>

#### MultiListItemSelector (Enums)

```dart
          MultiListItemSelector<Language>(
            items: Language.values,
            selectedItems: (List<Language> selectedItems,_) {
              debugPrint(selectedItems.toString());
            },
            builder: (_, index) {
              return ItemSelector(
                selectedItem: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    Language.values[index].name.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                unSelectedItem: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(Language.values[index].name.toString()),
                ),
              );
            },
          )

```

<p align="center">
  <img src="https://github.com/SinaSys/items_selector/blob/images/assets/images/widgets/multi_list_item/enum.gif?raw=true">
</p>

<br>

#### MultiListItemSelector (Custom classes)

```dart
          MultiListItemSelector<Person>(
            direction: Axis.vertical,
            items: people,
            selectedItems: (List<Person> selectedItems, _) {
              debugPrint(selectedItems.toString());
            },
            builder: (_, index) {
              Person person = people[index];
              return ItemSelector(
                selectedItem: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(
                      person.fullName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "Age : ${person.age}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: switch (person.gender.name) {
                      "male" => Image.asset("assets/images/male.png"),
                      _ => Image.asset("assets/images/female.png")
                    },
                  ),
                ),
                unSelectedItem: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(person.fullName),
                    subtitle: Text("Age : ${person.age}"),
                    trailing: switch (person.gender.name) {
                      "male" => Image.asset("assets/images/male.png"),
                      _ => Image.asset("assets/images/female.png")
                    },
                  ),
                ),
              );
            },
          )

```

<p align="center">
  <img src="https://github.com/SinaSys/items_selector/blob/images/assets/images/widgets/multi_list_item/class.gif?raw=true">
</p>

<br>


## MultiGridItemSelector 


#### MultiGridItemSelector (Primitive types)

```dart
MultiGridItemSelector<int>(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 130.0,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
        ),
        items: integerItems,
        selectedItems: (List<int> selectedItems, _) {
          debugPrint(selectedItems.toString());
        },
        builder: (_, index) {
          return ItemSelector(
            selectedItem: yourDesireWidget(),
            unSelectedItem: yourDesireWidget(),
          );
        },
      )
         
```

<p align="center">
  <img src="https://github.com/SinaSys/items_selector/blob/images/assets/images/widgets/multi_grid_item/primitive.gif?raw=true">
</p>

<br>

#### MultiGridItemSelector (Enums)

```dart
MultiGridItemSelector<Language>(
        items: Language.values,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 130.0,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
        ),
        selectedItems: (List<Language> selectedItems, _) {
          debugPrint(selectedItems.toString());
        },
        builder: (_, index) {
          return ItemSelector(
            selectedItem: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                Language.values[index].name.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            unSelectedItem: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.deepOrange.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(Language.values[index].name.toString()),
            ),
          );
        },
      )
         
```
<p align="center">
  <img src="https://github.com/SinaSys/items_selector/blob/images/assets/images/widgets/multi_grid_item/enums.gif?raw=true">
</p>

<br>


#### MultiGridItemSelector (Custom classes)

```dart
MultiGridItemSelector<Person>(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 170.0,
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 2.0,
          mainAxisExtent: 200,
        ),
        items: people,
        selectedItems: (List<Person> selectedItems, _) {
          debugPrint(selectedItems.toString());
        },
        builder: (_, index) {
          Person person = people[index];
          return ItemSelector(
            selectedItem: Container(
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
      )
         
```
<p align="center">
  <img src="https://github.com/SinaSys/items_selector/blob/images/assets/images/widgets/multi_grid_item/class.gif?raw=true">
</p>


<br>

