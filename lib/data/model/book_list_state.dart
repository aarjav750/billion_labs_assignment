import 'package:booker_app/data/model/book_model.dart';

sealed class BookListState {
  const BookListState();
}

class BookListInitial extends BookListState {}

class BookListLoading extends BookListState {}

class BookListLoaded extends BookListState {
  final List<Book> books;
  final String? nextPageUrl;

  const BookListLoaded(this.books, this.nextPageUrl);
}

class BookListError extends BookListState {
  final String errorMessage;

  const BookListError(this.errorMessage);
}
