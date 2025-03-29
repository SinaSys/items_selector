
# Items Selector

<p align="center">
  <img src="https://github.com/SinaSys/items_selector/blob/images/assets/images/other/main_image.png?raw=true" alt="Group 7">
</p>

<br>

# Introduction
This package provides a flexible and customizable solution for selecting items from a list. It supports both single and multi-selection modes, as well as the ability to define initial items (either fixed and non-selectable or selectable). The package offers versatile display options, including scrollable lists (horizontally or vertically), grid views, and wrap-based layouts for dynamic, multi-line item arrangements. Additionally, it is fully generic and supports all data types, making it adaptable to various use cases.


<br>


# Features
- Supports all primitive data types (e.g., int, String, etc.), enums, and custom classes.
- Built-in state management handled by the package.
- Provides both single-select and multi-select options.
- Fully customizable widgets for selected and unselected states.
- Displays scrollable lists horizontally or vertically.
- Supports grid view and wrap-based layouts for flexible item arrangement.
- Ability to define initial items (selectable or non-selectable).
- Animation support.


<br>


# How to use
In a terminal, located at the root of your package, run this command:
```dart
flutter pub add items_selector
```


<br>

# Options
## **SingleSelectOption**

`SingleSelectOption` is used within the **SingleListItemSelector**, **SingleGridItemSelector**, and **SingleWrapItemSelector** widgets and includes two boolean properties:

- **`allowUnselectedInitialItems`**  
  When the `initialItems` property is set, enabling this option allows those initial items to be **unselected**.

- **`allowUnselectedMainItems`**  
  Enabling this option prevents the **main items** from being selected.


| Row | Initial Items | Main Items | Allow Unselect Main Items | Allow Unselect Initial Items | Image | 
|:---:|:------------:|:---------:|:-----------------------:|:--------------------------:|:-----------------:|
| 1  | Y | Y | Y | Y | ![1](https://github.com/SinaSys/items_selector/blob/images/assets/images/options/single/1.gif?raw=true)   |
| 2  | Y | Y | Y | N | ![5](https://github.com/SinaSys/items_selector/blob/images/assets/images/options/single/2.gif?raw=true)   |
| 3  | Y | Y | N | Y | ![9](https://github.com/SinaSys/items_selector/blob/images/assets/images/options/single/3.gif?raw=true)   |
| 4  | Y | Y | N | N | ![13](https://github.com/SinaSys/items_selector/blob/images/assets/images/options/single/4.gif?raw=true)  |
| 5  | N | Y | N | N | ![14](https://github.com/SinaSys/items_selector/blob/images/assets/images/options/single/5.gif?raw=true)  |

<br>

## **MultiSelectOption**

`MultiSelectOption` is used within the **MultiListItemSelector**, **MultiGridItemSelector**, and **MultiWrapItemSelector** widgets and includes two properties:

- **`allowUnselectedInitialItems`**  
  When the `initialItems` property is set, enabling this option allows those initial items to be **unselected**.

- **`maxItems`**  
  Defines the maximum number of items that can be selected.


| Row | Initial Items | Main Items | Allow Unselect Initial Items | Max Items | Image |
|:---:|:------------:|:--------:|:----------------------:|:---------:|:-----:|
| 1  | Y | Y | Y | Y | ![6](https://github.com/SinaSys/items_selector/blob/images/assets/images/options/multi/1.gif?raw=true) |
| 2  | Y | Y | N | Y | ![5](https://github.com/SinaSys/items_selector/blob/images/assets/images/options/multi/2.gif?raw=true) | 
| 3  | N | Y | N | Y | ![4](https://github.com/SinaSys/items_selector/blob/images/assets/images/options/multi/3.gif?raw=true) | 
| 4  | Y | Y | Y | N | ![3](https://github.com/SinaSys/items_selector/blob/images/assets/images/options/multi/4.gif?raw=true) |
| 5  | Y | Y | N | N | ![2](https://github.com/SinaSys/items_selector/blob/images/assets/images/options/multi/5.gif?raw=true) |
| 6  | N | Y | N | N | ![1](https://github.com/SinaSys/items_selector/blob/images/assets/images/options/multi/6.gif?raw=true) | 

<br>

## Widgets  

`ListSelector`, `GridSelector`, and `WrapSelector` provide a flexible solution for selecting items from a collection, supporting both single and multi-selection modes.  

### 🔹 Common Properties (Available in All Widgets)  
- **`items`** → Defines the available list of items.  
- **`builder`** → Creates custom widgets for selected and unselected states via `selectedItem` and `unSelectedItem`.  
- **`selectedItems`** → Returns the list of selected items when a selection is made.  
- **`initialItems`** (optional) → Allows specifying pre-selected items at initialization.  
- **`hasLongPress`** (optional) → Enables selection using a long press instead of a regular tap. Default is `false`.  
- **`options`** → Defines selection behavior and supports both `SingleSelectOption` and `MultiSelectOption`.  

### 🔹 Layout-Specific Properties  
- **`wrapConfiguration`** (only for `WrapSelector`) → Encapsulates `Wrap`-specific properties such as `alignment`, `spacing`, `runSpacing`, etc.  
- **`listConfiguration`** (only for `ListSelector`) → Provides greater flexibility by allowing access to `ListView` properties such as scrolling behavior, physics, controllers, and other customizable options.  
- **`direction`** (only for `ListSelector`) → Defines the layout direction (`Axis.horizontal` or `Axis.vertical`). Default is `Axis.horizontal`.  
- **`gridConfiguration`** (only for `GridSelector`) → Determines the grid behavior and must be set to one of the following configurations:  
  - `BuilderConfiguration` → For `GridSelector.builder`, similar to `GridView.builder`.  
  - `CountConfiguration` → For `GridSelector.count`, similar to `GridView.count`.  
  - `ExtentConfiguration` → For `GridSelector.extent`, similar to `GridView.extent`.  

---

## ⚙️ Selection Behavior  
- **All Widgets (`ListSelector`, `GridSelector`, `WrapSelector`)** → Use a unified `options` parameter, which supports:  
  - **`SingleSelectOption`**  
    - `allowUnselectInitialItems` → Controls if initial items can be unselected.  
    - `allowUnselectMainItems` → Determines if main items can be unselected.  
  - **`MultiSelectOption`**  
    - `allowUnselectInitialItems` → Controls if initial items can be unselected.  
    - `maxItems` → Limits the number of selectable items.  

---

## 🖼️ Layout Differences  
- **📜 List-based Widget** → `ListSelector` uses `ListView` for rendering items.  
  - Provides two named constructors:  
    - `ListSelector.builder` → Uses a builder function to generate items dynamically.  
    - `ListSelector.separated` → Requires an additional `separatorBuilder` parameter to define separators between items.  
- **🔲 Grid-based Widget** → `GridSelector` provides three named constructors:  
  - `GridSelector.builder` → Uses a builder function to create grid items dynamically.  
  - `GridSelector.count` → Uses a fixed number of columns.  
  - `GridSelector.extent` → Uses a maximum cross-axis extent for items.  
  - Requires a corresponding `GridConfiguration` (`BuilderConfiguration`, `CountConfiguration`, or `ExtentConfiguration`).  
- **🔀 Wrap-based Widget** → `WrapSelector` provides a flexible item arrangement with automatic line breaks.  
  - It has a single constructor and does not use named constructors.  




<br>
<br>
<br>


### ListSelector 

```dart
          ListSelector<YourDataType>.builder(
            items: yourListOfItems,
            direction: Axis.horizontal, // Set to Axis.horizontal or Axis.vertical based on layout preference
            options: SingleSelectOptions(), // Can be SingleSelectOptions() or MultiSelectOptions() based on your requirement
            listConfiguration: ListConfiguration(
              shrinkWrap: true,
              // You can also pass other ListView properties like physics, controller, etc.
            ),
            selectedItems: (List<YourDataType> selectedItems, _) {
              debugPrint(selectedItems.toString());
            },
            builder: (_, index) {
              return ItemSelector(
                selectedItem: yourDesiredWidget(),
                unSelectedItem: yourDesiredWidget(),
              );
            },
          )


        // Use ListSelector.separated if you need separators between items

          ListSelector<YourDataType>.separated(
            items: yourListOfItems,
            direction: Axis.horizontal, // Set to Axis.horizontal or Axis.vertical based on layout preference
            options: MultiSelectOptions(), // Can be SingleSelectOptions() or MultiSelectOptions() based on your requirement
            listConfiguration: ListConfiguration(
              shrinkWrap: true,
              // You can also pass other ListView properties like physics, controller, etc.
            ),
            selectedItems: (List<YourDataType> selectedItems, _) {
              debugPrint(selectedItems.toString());
            },
            separatorBuilder: (_, index) {
              return yourDesiredWidget(); // Example separator widget
            },
            builder: (_, index) {
              return ItemSelector(
                selectedItem: yourDesiredWidget(),
                unSelectedItem: yourDesiredWidget(),
              );
            },
          )


```

<p align="center">
  <img src="https://github.com/SinaSys/items_selector/blob/images/assets/images/widgets/single_list_item/primitive.gif?raw=true">
</p>


<br>


### MultiListItemSelector (Enums)

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


### SingleGridItemSelector (Enums)

```dart
 SingleGridItemSelector<Language>(
          gridConfiguration: GridConfiguration(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 130.0,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
          ),
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



### MultiGridItemSelector (Custom classes)

```dart
MultiGridItemSelector<Person>(
      gridConfiguration: GridConfiguration(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 130.0,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          mainAxisExtent: 200,
        ),
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

### SingleWrapItemSelector

```dart
          SingleWrapItemSelector<yourDataType>(
            wrapConfiguration: WrapConfiguration(
              spacing: 10,
              runSpacing: 20.0,
              ....
            ),
            items: yourListItem,
            selectedItems: (List<yourDataTypes> selectedItems, _) {
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
  <img src="https://github.com/SinaSys/items_selector/blob/images/assets/images/widgets/single_wrap_item/single_wrap_item.gif?raw=true">
</p>



<br>
<br>

# Examples

| Widget                     | Example | 
|:--------------------------:|:--------------:|
| SingleListItemSelector    | [code](https://github.com/SinaSys/items_selector/tree/master/example/lib/list_item_selector/single_item_selector)             | 
| MultiListItemSelector     |  [code](https://github.com/SinaSys/items_selector/tree/master/example/lib/list_item_selector/multi_item_selector)           | 
| SingleGridItemSelector     |  [code](https://github.com/SinaSys/items_selector/tree/master/example/lib/grid_item_selector/single_item_selector)           | 
| MultiGridItemSelector      |  [code](https://github.com/SinaSys/items_selector/tree/master/example/lib/grid_item_selector/multi_item_selector)           | 
| SingleWrapItemSelector     |  [code](https://github.com/SinaSys/items_selector/tree/master/example/lib/wrap_item_selector/single_wrap_selector)           | 
| MultiWrapItemSelector      |  [code](https://github.com/SinaSys/items_selector/tree/master/example/lib/wrap_item_selector/multi_wrap_selector)           | 

<br>

| Options                     | Example | 
|:--------------------------:|:--------------:|
| SingleSelectOptions    | [code](https://github.com/SinaSys/items_selector/blob/master/example/lib/options/example_single_option.dart)             | 
| MultiSelectOptions     |  [code](https://github.com/SinaSys/items_selector/blob/master/example/lib/options/example_multi_option.dart)           | 


<br>
<br>


## ⚠️ Troubleshooting

### Issue: `initialItems` Not Working for Custom Classes
If you use a **custom class** as the item type and set the `initialItems` property, you might notice that the initial items are **not selected** when the app runs. This happens because **Dart uses reference equality by default**, meaning it does not automatically recognize two objects as equal even if their properties have the same values.

### ✅ Solution 1: Override `==` Operator and `hashCode`
To ensure Dart correctly identifies equal objects, override the **equality (`==`) operator** and **hashCode** in your custom class:

```dart
class CustomItem {
  final int id;
  final String name;

  CustomItem(this.id, this.name);

  @override
  bool operator ==(Object other) =>
          identical(this, other) || (other is CustomItem && other.id == id && other.name == name);

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
```

### ✅ Solution 2: Use the equatable Package
Instead of manually overriding == and hashCode, you can use the **equatable** package to simplify equality checks.

1️⃣ **Add `equatable` to your dependencies:**
```dart
flutter pub add equatable
```
2️⃣ Modify your custom class to extend `equatable`:

```dart
import 'package:equatable/equatable.dart';

class CustomItem extends Equatable {
  final int id;
  final String name;

  const CustomItem(this.id, this.name);

  @override
  List<Object> get props => [id, name];
}

```

With **Equatable**, Dart will automatically handle equality comparisons, ensuring `initialItems` work correctly! 🎯

