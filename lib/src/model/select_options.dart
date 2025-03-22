import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class SelectOptions {
  final bool? allowUnselectInitialItem;
  final int? maxItems;

  const SelectOptions({this.allowUnselectInitialItem = false, this.maxItems});
}

@immutable
final class SingleSelectOptions extends SelectOptions {
  final bool? allowUnselectMainItem;

  const SingleSelectOptions({
    this.allowUnselectMainItem = false,
    super.allowUnselectInitialItem = true,
  });
}

@immutable
final class MultiSelectOptions extends SelectOptions {
  const MultiSelectOptions({
    super.allowUnselectInitialItem = false,
    super.maxItems,
  });
}
