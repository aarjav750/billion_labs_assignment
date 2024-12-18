import 'package:booker_app/data/model/book_model.dart';

class BookApiResponseModel {
  final int count;
  final String? next;
  final String? previous;
  final List<Book> results;

  BookApiResponseModel({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory BookApiResponseModel.fromJson(Map<String, dynamic> json) {
    return BookApiResponseModel(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List<dynamic>)
          .map((bookJson) => Book.fromJson(bookJson))
          .toList(),
    );
  }
}
