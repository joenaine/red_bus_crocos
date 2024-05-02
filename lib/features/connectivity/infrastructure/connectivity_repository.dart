import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:red_bus_crocos_project/domain/connectivity/i_connectivity_repository.dart';

@LazySingleton(as: IConnectivityRepository)
class ConnectivityRepository implements IConnectivityRepository {
  final Connectivity _connectivity;

  ConnectivityRepository(this._connectivity);

  @override
  Stream<ConnectivityResult> getConnectivityInfo() async* {
    yield* _connectivity.onConnectivityChanged;
  }
}
