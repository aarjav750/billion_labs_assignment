import 'package:booker_app/data/model/book_api_response_model.dart';

abstract class BookDataRepo {
  Future<BookApiResponseModel> getBookData({String? url});
}
