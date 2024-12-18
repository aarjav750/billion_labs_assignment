import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booker_app/data/model/book_list_state.dart';
import 'package:booker_app/presentation/book_list/cubit/book_list_cubit.dart';
import 'package:booker_app/presentation/book_list/widgets/book_list_loaded_widget.dart';

class BookListViewBlocBuilder extends StatelessWidget {
  const BookListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookListCubit, BookListState>(
      builder: (context, state) {
        if (state is BookListInitial || state is BookListLoading) {
          return const SliverToBoxAdapter(
            child: SizedBox(
              height: 400,
              child: Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            ),
          );
        } else if (state is BookListError) {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: 400,
              child: Center(child: Text(state.errorMessage)),
            ),
          );
        } else if (state is BookListLoaded) {
          return BookListLoadedWidget(
            state.books,
            state.nextPageUrl,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
