// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:red_bus_crocos_project/domain/connectivity/i_connectivity_repository.dart'
    as _i7;
import 'package:red_bus_crocos_project/domain/location/i_user_location_repository.dart'
    as _i4;
import 'package:red_bus_crocos_project/features/connectivity/cubit/connectivity_cubit.dart'
    as _i6;
import 'package:red_bus_crocos_project/infrastructure/core/injectable_module.dart'
    as _i8;
import 'package:red_bus_crocos_project/infrastructure/location/user_location_repository.dart'
    as _i5;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firebaseInjectableModule = _$FirebaseInjectableModule();
    await gh.factoryAsync<_i3.SharedPreferences>(
      () => firebaseInjectableModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i4.IUserLocationRepository>(
        () => _i5.UserLocationRepository(gh<_i3.SharedPreferences>()));
    gh.factory<_i6.ConnectivityCubit>(
        () => _i6.ConnectivityCubit(gh<_i7.IConnectivityRepository>()));
    return this;
  }
}

class _$FirebaseInjectableModule extends _i8.FirebaseInjectableModule {}
