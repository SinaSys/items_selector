import 'package:flutter/foundation.dart' show immutable;

@immutable
sealed class SelectOptions {
  final bool? allowUnselectInitialItems;
  final int? maxItems;

  const SelectOptions({
    this.allowUnselectInitialItems = false,
    this.maxItems,
  });
}

@immutable
final class SingleSelectOptions extends SelectOptions {
  final bool? allowUnselectMainItems;

  const SingleSelectOptions({
    this.allowUnselectMainItems = false,
    super.allowUnselectInitialItems,
  });
}

@immutable
final class MultiSelectOptions extends SelectOptions {
  const MultiSelectOptions({
    super.allowUnselectInitialItems,
    super.maxItems,
  });
}
