import 'package:connectivity_plus/connectivity_plus.dart';

abstract interface class IConnectivityRepository {
  Stream<ConnectivityResult> getConnectivityInfo();
}
