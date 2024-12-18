import 'package:booker_app/core/network_info.dart';
import 'package:booker_app/data/data_source/remote_data_source.dart';
import 'package:booker_app/data/repo/data_repo.dart';
import 'package:booker_app/domain/usecase/book_data_usecase.dart';
import 'package:booker_app/presentation/book_list/cubit/book_list_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

final GetIt getAppService = GetIt.instance;

class Inject {
  static Future<void> initAppServiceLocator() async {
    getAppService.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(),
    );

    getAppService.registerLazySingleton(() => InternetConnection());

    getAppService.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(
        getAppService<InternetConnection>(),
      ),
    );

    getAppService.registerLazySingleton<BookDataRepo>(
      () => BookDataRepoImpl(
        getAppService<RemoteDataSource>(),
        getAppService<NetworkInfo>(),
      ),
    );

    getAppService.registerFactory<BookListCubit>(
      () => BookListCubit(getAppService<BookDataRepo>()),
    );
  }
}
