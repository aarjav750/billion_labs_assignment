import 'package:booker_app/presentation/book_details/filter_option_state/filter_option.dart';
import 'package:flutter/material.dart';

class FilterOptionWidget extends StatelessWidget {
  const FilterOptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 255, 223, 201),
      title: const Text('Filter By?'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('Author/Book Name'),
            leading: Radio<FilterOption>(
              activeColor: Colors.black,
              value: FilterOption.authorBookName,
              groupValue: CurrentFilterOption.selectedFilter,
              onChanged: (FilterOption? value) {
                if (value != null) {
                  CurrentFilterOption.changeFilter(value);
                  Navigator.pop(context);
                }
              },
            ),
          ),
          ListTile(
            title: const Text('Topic'),
            leading: Radio<FilterOption>(
              activeColor: Colors.black,
              value: FilterOption.topic,
              groupValue: CurrentFilterOption.selectedFilter,
              onChanged: (FilterOption? value) {
                if (value != null) {
                  CurrentFilterOption.changeFilter(value);
                  Navigator.pop(context);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
