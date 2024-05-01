// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:red_bus_crocos_project/application/location/user_location_bloc.dart'
    as _i10;
import 'package:red_bus_crocos_project/domain/connectivity/i_connectivity_repository.dart'
    as _i7;
import 'package:red_bus_crocos_project/domain/location/i_user_location_repository.dart'
    as _i5;
import 'package:red_bus_crocos_project/features/connectivity/cubit/connectivity_cubit.dart'
    as _i9;
import 'package:red_bus_crocos_project/features/connectivity/infrastructure/connectivity_repository.dart'
    as _i8;
import 'package:red_bus_crocos_project/infrastructure/core/injectable_module.dart'
    as _i11;
import 'package:red_bus_crocos_project/infrastructure/location/user_location_repository.dart'
    as _i6;
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
    final injectableModule = _$InjectableModule();
    await gh.factoryAsync<_i3.SharedPreferences>(
      () => injectableModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i4.Connectivity>(() => injectableModule.connectivity);
    gh.lazySingleton<_i5.IUserLocationRepository>(
        () => _i6.UserLocationRepository(gh<_i3.SharedPreferences>()));
    gh.lazySingleton<_i7.IConnectivityRepository>(
        () => _i8.ConnectivityRepository(gh<_i4.Connectivity>()));
    gh.factory<_i9.ConnectivityCubit>(
        () => _i9.ConnectivityCubit(gh<_i7.IConnectivityRepository>()));
    gh.factory<_i10.UserLocationBloc>(() => _i10.UserLocationBloc(
          gh<_i5.IUserLocationRepository>(),
          gh<_i9.ConnectivityCubit>(),
        ));
    return this;
  }
}

class _$InjectableModule extends _i11.InjectableModule {}
