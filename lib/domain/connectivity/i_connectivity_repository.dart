import 'package:connectivity_plus/connectivity_plus.dart';

abstract interface class IConnectivityRepository {
  Stream<List<ConnectivityResult>> getConnectivityInfo();
}
