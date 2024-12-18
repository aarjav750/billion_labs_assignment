import 'package:booker_app/data/model/book_model.dart';
import 'package:booker_app/presentation/book_list/widgets/book_card_widget.dart';
import 'package:flutter/material.dart';

class BookListLoadedWidget extends StatelessWidget {
  const BookListLoadedWidget(this.books, this.nextPageUrl, {super.key});

  final List<Book> books;
  final String? nextPageUrl;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: books.length + (nextPageUrl != null ? 1 : 0),
      itemBuilder: (context, index) {
        if (index < books.length) {
          final book = books[index];
          return BookCard(book);
        } else {
          return const LinearProgressIndicator(
            minHeight: 10,
            color: Colors.white,
            backgroundColor: Colors.grey,
          );
        }
      },
    );
  }
}
