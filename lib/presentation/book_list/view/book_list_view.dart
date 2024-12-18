import 'package:booker_app/presentation/book_list/cubit/book_list_cubit.dart';
import 'package:booker_app/presentation/book_list/widgets/bloc_builder.dart';
import 'package:booker_app/presentation/book_list/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookListView extends StatefulWidget {
  const BookListView({super.key});

  @override
  State<BookListView> createState() => _BookListViewState();
}

class _BookListViewState extends State<BookListView> {
  bool _isLoadingMore = false;
  final ScrollController _scrollController = ScrollController();

  void _isScrolledToBottom() async {
    if (_isLoadingMore) return;

    if ((_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 50)) {
      _isLoadingMore = true;

      await context.read<BookListCubit>().fetchNextPage();

      _isLoadingMore = false;
    }
  }

  @override
  void initState() {
    _scrollController.addListener(_isScrolledToBottom);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 179, 154, 134),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: const [
          CustomAppBar(),
          BookListViewBlocBuilder(),
        ],
      ),
    );
  }
}
