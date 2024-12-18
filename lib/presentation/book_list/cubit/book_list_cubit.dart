import 'package:booker_app/core/network_constants.dart';
import 'package:booker_app/data/model/book_list_state.dart';
import 'package:booker_app/domain/usecase/book_data_usecase.dart';
import 'package:booker_app/presentation/book_details/filter_option_state/filter_option.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookListCubit extends Cubit<BookListState> {
  final BookDataRepo bookDataUseCaseRepo;

  BookListCubit(this.bookDataUseCaseRepo) : super(BookListInitial());

  Future<void> searchBooks(String searchString) async {
    final filterOption = CurrentFilterOption.selectedFilter;

    if (filterOption == FilterOption.authorBookName) {
      await _fetchBooksBySearch(searchString);
    } else if (filterOption == FilterOption.topic) {
      await _fetchBooksByTopic(searchString);
    } else {
      await fetchBooks();
    }
  }

  Future<void> fetchBooks() async {
    emit(BookListLoading());
    try {
      final data = await bookDataUseCaseRepo.getBookData();
      emit(BookListLoaded(data.results, data.next));
    } catch (e) {
      emit(BookListError(e.toString()));
    }
  }

  Future<void> _fetchBooksBySearch(String searchText) async {
    emit(BookListLoading());
    final url = "${NetworkConstants.bookApiUrl}?search=$searchText";
    try {
      final data = await bookDataUseCaseRepo.getBookData(url: url);
      emit(BookListLoaded(data.results, data.next));
    } catch (e) {
      emit(BookListError(e.toString()));
    }
  }

  Future<void> _fetchBooksByTopic(String searchTopic) async {
    emit(BookListLoading());
    final url = "${NetworkConstants.bookApiUrl}?topic=$searchTopic";
    try {
      final data = await bookDataUseCaseRepo.getBookData(url: url);
      emit(BookListLoaded(data.results, data.next));
    } catch (e) {
      emit(BookListError(e.toString()));
    }
  }

  Future<void> fetchNextPage() async {
    if (state is BookListLoaded) {
      final currentState = state as BookListLoaded;
      if (currentState.nextPageUrl != null) {
        try {
          final nextPageData = await bookDataUseCaseRepo.getBookData(
            url: currentState.nextPageUrl!,
          );

          final updatedBooks = [...currentState.books, ...nextPageData.results];

          emit(BookListLoaded(
            updatedBooks,
            nextPageData.next,
          ));
        } catch (e) {
          emit(BookListError(e.toString()));
        }
      }
    }
  }
}
