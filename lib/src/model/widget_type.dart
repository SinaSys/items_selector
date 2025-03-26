enum WidgetType {
  singleListItemSelector,
  multiListItemSelector,
  singleGridItemSelector,
  multiGridItemSelector,
  singleWrapItemSelector,
  multiWrapItemSelector;

  const WidgetType();

  bool get isSingleTypeWidget {
    return switch (this) {
      singleListItemSelector || singleGridItemSelector || singleWrapItemSelector => true,
      _ => false
    };
  }
}
