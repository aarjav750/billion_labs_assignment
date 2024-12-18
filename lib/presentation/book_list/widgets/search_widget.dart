import 'package:booker_app/presentation/book_list/widgets/filter_option_widget.dart';
import 'package:booker_app/presentation/book_list/cubit/book_list_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: TextField(
        maxLines: 1,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          prefixIcon: const Icon(Icons.search, size: 28),
          suffixIcon: IconButton(
            onPressed: () => showDialog(
              context: context,
              builder: (ctx) => const FilterOptionWidget(),
            ),
            icon: const Icon(CupertinoIcons.text_badge_plus, size: 28),
          ),
          filled: true,
          fillColor: const Color.fromARGB(255, 255, 246, 246),
          hintText: 'Type and press Enter to search!',
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
        onSubmitted: (value) {
          context.read<BookListCubit>().searchBooks(value);
        },
      ),
    );
  }
}
