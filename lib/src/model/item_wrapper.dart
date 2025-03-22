class ItemWrapper<T> {
  T item;
  bool isSelected;
  bool isInitialItem;
  bool activeLock = false;

  ItemWrapper(
    this.item,
    this.isSelected, {
    this.activeLock = false,
    this.isInitialItem = false,
  });

  @override
  String toString() {
    return 'ItemWrapper{item: $item, isSelected: $isSelected}\n';
  }
}
