import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  NetworkInfoImpl(this._internetConnectionChecker);

  final InternetConnection _internetConnectionChecker;

  @override
  Future<bool> get isConnected async =>
      await _internetConnectionChecker.hasInternetAccess;
}
