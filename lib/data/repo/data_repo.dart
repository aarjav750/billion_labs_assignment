import 'package:booker_app/core/network_info.dart';
import 'package:booker_app/data/data_source/remote_data_source.dart';
import 'package:booker_app/data/model/book_api_response_model.dart';
import 'package:booker_app/domain/usecase/book_data_usecase.dart';

class BookDataRepoImpl implements BookDataRepo {
  final RemoteDataSource remoteData;
  final NetworkInfo networkInfo;

  BookDataRepoImpl(this.remoteData, this.networkInfo);

  @override
  Future<BookApiResponseModel> getBookData({String? url}) async {
    if (await networkInfo.isConnected) {
      try {
        return await remoteData.fetchBooks(url: url);
      } catch (e) {
        throw Exception("Cannot load data, please try again later!");
      }
    } else {
      throw Exception("Internet access is required to load data!");
    }
  }
}
