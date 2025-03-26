## 0.0.1

* release initial version

## 0.1.1

- Updated `README.md` for better clarity.

## 0.1.2

- Add examples

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
