enum FilterOption { authorBookName, topic }

class CurrentFilterOption {
  static FilterOption _selectedFilter = FilterOption.authorBookName;

  static FilterOption get selectedFilter => _selectedFilter;

  static void changeFilter(FilterOption option) {
    _selectedFilter = option;
  }
}
