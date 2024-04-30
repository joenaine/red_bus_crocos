import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:connectivity_plus_platform_interface/src/enums.dart';
import 'package:red_bus_crocos_project/domain/connectivity/i_connectivity_repository.dart';

class ConnectivityRepository implements IConnectivityRepository {
  final Connectivity _connectivity;

  ConnectivityRepository(this._connectivity);

  @override
  Stream<List<ConnectivityResult>> getConnectivityInfo() async* {
    yield* _connectivity.onConnectivityChanged;
  }
}
