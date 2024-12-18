import 'package:booker_app/inject.dart';
import 'package:booker_app/presentation/book_list/cubit/book_list_cubit.dart';
import 'package:booker_app/presentation/book_list/view/book_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookListPage extends StatelessWidget {
  const BookListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => getAppService<BookListCubit>()..fetchBooks(),
      child: const BookListView(),
    );
  }
}
