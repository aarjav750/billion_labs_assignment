import 'dart:convert';
import 'package:booker_app/core/network_constants.dart';
import 'package:booker_app/data/model/book_api_response_model.dart';
import 'package:http/http.dart';

abstract class RemoteDataSource {
  Future<BookApiResponseModel> fetchBooks({String? url});
}

class RemoteDataSourceImpl extends RemoteDataSource {
  @override
  Future<BookApiResponseModel> fetchBooks({String? url}) async {
    final response = await get(
      Uri.parse(url ?? NetworkConstants.bookApiUrl),
    );

    try {
      final String utf8DecodedData = utf8.decode(response.bodyBytes);
      return BookApiResponseModel.fromJson(jsonDecode(utf8DecodedData));
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
