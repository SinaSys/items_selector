## [2.1.1] 

### 🛠 Fixed
- **Resolved an unused element warning** in `GridSelector`:
    - Fixed the warning: *"The declaration 'GridSelector._' isn't referenced."*
    - Removed the unused private constructor declaration.
    - No functionality was affected—this was purely an internal cleanup.

### 📌 Notes
- **No breaking changes**.
- This update improves code cleanliness but does not impact functionality.
- Safe to upgrade from `2.1.0` without modifications.


## [2.1.0]

### 🚀 Added

- **Generative constructor for `ListSelector`**:
    - Previously, `ListSelector` could only be used via `ListSelector.builder` and
      `ListSelector.separated`.
    - Now, the main constructor (`ListSelector()`) is accessible.
    - This allows users to use `Row` or `Column` under the hood based on the `direction` property.

- **New `flexConfiguration` property for `ListSelector`**:
    - `ListSelector.builder` and `ListSelector.separated` use `listConfiguration` (ListView-based).
    - `ListSelector()` now uses `flexConfiguration`, which supports Row/Column properties like:
        - `mainAxisAlignment`
        - `crossAxisAlignment`
        - `mainAxisSize`
        - `textDirection`
        - `verticalDirection`
        - `textBaseline`
        - `clipBehavior`
        - `spacing`

### 🔄 Changed

- `ListSelector.builder` and `ListSelector.separated` **still work the same** (using `ListView`
  under the hood).
- The default behavior remains unchanged—developers can now **choose between `ListView`
  and `Row/Column`** based on their needs.

### 📌 Migration Notes

- **No breaking changes**.
- If you prefer to use **Row/Column**, you can now use the **new generative constructor** and pass a
  `flexConfiguration`.
- If you are already using `ListSelector.builder` or `ListSelector.separated`, **no changes are
  required**.

## [2.0.0]

### 🚀 Added

- Introduced three new widgets:
    - **`ListSelector`** → Replaces `SingleListItemSelector` & `MultiListItemSelector`.
    - **`GridSelector`** → Replaces `SingleGridItemSelector` & `MultiGridItemSelector`.
    - **`WrapSelector`** → Replaces `SingleWrapItemSelector` & `MultiWrapItemSelector`.
- `ListSelector` now provides two named constructors:
    - **`ListSelector.builder`** → Builds a list of selectable items.
    - **`ListSelector.separated`** → Adds separators between list items.
- `GridSelector` introduces three named constructors mirroring Flutter's `GridView`:
    - **`GridSelector.builder`**
    - **`GridSelector.count`**
    - **`GridSelector.extent`**
- All widgets now take a **`SelectedOption`** parameter, which accepts both `SingleSelectOptions`
  and `MultiSelectOptions`, offering a unified API.
- **Improved API consistency** across all selectors, simplifying usability.

### 🔄 Changed

- `ListSelector` always uses **`ListView`** under the hood instead of switching between `Row/Column`
  and `ListView`.
- `GridSelector` uses a **sealed class configuration (`GridConfiguration`)**, requiring the correct
  subtype (`BuilderConfiguration`, `CountConfiguration`, or `ExtentConfiguration`) for each named
  constructor.
- Codebase refactored for better readability and maintainability.

### ⚠️ Migration Guide

This update includes **breaking changes** that require adjustments to your existing code.

- **Replace old widgets with new ones**:
    - `SingleListItemSelector` → **`ListSelector.builder`** or **`ListSelector.separated`**
    - `MultiListItemSelector` → **`ListSelector.builder`** or **`ListSelector.separated`**
    - `SingleGridItemSelector` → **`GridSelector.builder`**, **`GridSelector.count`**, or *
      *`GridSelector.extent`**
    - `MultiGridItemSelector` → **`GridSelector.builder`**, **`GridSelector.count`**, or *
      *`GridSelector.extent`**
    - `SingleWrapItemSelector` → **`WrapSelector`**
    - `MultiWrapItemSelector` → **`WrapSelector`**
- Use the **new `SelectedOption` parameter** instead of separate selection options.
- Ensure **GridSelector** uses the correct **`GridConfiguration` subtype** for its named
  constructors.
- `ListSelector.separated` requires an additional **`separatorBuilder`** parameter.

## [1.1.0]

### Added

- **`listConfiguration`** property introduced in `SingleListItemSelector` & `MultiListItemSelector`.
    - This allows users to switch from `Row`/`Column` to `ListView`, providing greater flexibility
      and access to `ListView` features such as scrolling behavior, physics, controllers, and more.
    - If `listConfiguration` is not provided, the default behavior remains unchanged.

### Changed

- **Refactored codebase** for better readability and maintainability. No functional changes were
  made.
- **Updated example files** to reflect recent improvements and demonstrate new capabilities.

### Migration Notes

- No breaking changes. Upgrading to this version will not cause any compilation errors or issues.

## [1.0.1]

### Fixed

- Corrected the image URL in the README to properly display on pub.dev.

This update does not change any functionality but ensures that documentation is correctly presented
to users.

## [1.0.0]

### Added

- Introduced **`SingleWrapItemSelector`** and **`MultiWrapItemSelector`** widgets, providing
  flexible item arrangement using the `Wrap` layout.

### Changed

- **Removed default padding** applied to all widgets to give users more control over layout spacing.
- **Removed `SingleChildScrollView`** from `SingleListItemSelector` and `MultiListItemSelector` to
  avoid unintended scrolling behavior.

### Fixed

- General improvements to layout consistency and flexibility.

## [0.2.0]

### Changed

- **Refactored `SingleGridItemSelector` & `MultiGridItemSelector`**
    - Properties related to `GridView` (such as `gridDelegate`, `controller`, `physics`, etc.)  have
      been **removed** from `SingleGridItemSelector` and `MultiGridItemSelector` and moved into a
      new class: `GridConfiguration`.
    - Both widgets now accept a `GridConfiguration` instance instead of multiple individual
      GridView-related properties.

### Added

- **New `GridConfiguration` class**
    - Encapsulates all `GridView` configuration properties, making `SingleGridItemSelector` and
      `MultiGridItemSelector` cleaner and more modular.
    - Simplifies the API by grouping all grid-related options into a single parameter.

### Migration Guide

- Instead of passing `gridDelegate`, `controller`, `physics`, etc., directly to
  `SingleGridItemSelector` or `MultiGridItemSelector`, create a `GridConfiguration` instance and
  pass it as a parameter.

  **Before:**
  ```dart
  SingleGridItemSelector<int>(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    padding: EdgeInsets.all(8),
    controller: ScrollController(),
    ...
  )

  MultiGridItemSelector<int>(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
    padding: EdgeInsets.symmetric(horizontal: 16),
    controller: ScrollController(),
    ...
  )
  ```

  **After:**
  ```dart
  SingleGridItemSelector<int>(
    gridConfiguration: GridConfiguration(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    padding: EdgeInsets.all(8),
    controller: ScrollController(),
    ...
   )
  )

  MultiGridItemSelector<int>(
    gridConfiguration: GridConfiguration(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
    padding: EdgeInsets.symmetric(horizontal: 16),
    controller: ScrollController(),
    ...
    )
  )
  ```

## [0.1.2]

- Add examples

## [0.1.1]

- Updated `README.md` for better clarity.

## [0.0.1]

* release initial version


