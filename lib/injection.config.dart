// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i5;
import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:red_bus_crocos_project/application/home/bus_location/bus_location_bloc.dart'
    as _i8;
import 'package:red_bus_crocos_project/application/home/location/user_location_bloc.dart'
    as _i16;
import 'package:red_bus_crocos_project/application/locale/locale_bloc.dart'
    as _i3;
import 'package:red_bus_crocos_project/application/sight/sights_bloc.dart'
    as _i11;
import 'package:red_bus_crocos_project/application/sight_detail/sight_detail_bloc.dart'
    as _i12;
import 'package:red_bus_crocos_project/domain/connectivity/i_connectivity_repository.dart'
    as _i13;
import 'package:red_bus_crocos_project/domain/location/i_user_location_repository.dart'
    as _i9;
import 'package:red_bus_crocos_project/features/connectivity/cubit/connectivity_cubit.dart'
    as _i15;
import 'package:red_bus_crocos_project/features/connectivity/infrastructure/connectivity_repository.dart'
    as _i14;
import 'package:red_bus_crocos_project/infrastructure/core/injectable_module.dart'
    as _i17;
import 'package:red_bus_crocos_project/infrastructure/location/user_location_repository.dart'
    as _i10;
import 'package:red_bus_crocos_project/infrastructure/sights/sights_repository.dart'
    as _i7;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

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
    gh.factory<_i3.LocaleBloc>(() => _i3.LocaleBloc());
    await gh.factoryAsync<_i4.SharedPreferences>(
      () => injectableModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i5.Connectivity>(() => injectableModule.connectivity);
    gh.lazySingleton<_i6.Dio>(() => injectableModule.dio);
    gh.lazySingleton<_i7.SightsRepository>(() => _i7.SightsRepository());
    gh.factory<_i8.BusLocationBloc>(() => _i8.BusLocationBloc(gh<_i6.Dio>()));
    gh.lazySingleton<_i9.IUserLocationRepository>(
        () => _i10.UserLocationRepository(gh<_i4.SharedPreferences>()));
    gh.factory<_i11.SightsBloc>(
        () => _i11.SightsBloc(gh<_i7.SightsRepository>()));
    gh.factory<_i12.SightDetailBloc>(
        () => _i12.SightDetailBloc(gh<_i7.SightsRepository>()));
    gh.lazySingleton<_i13.IConnectivityRepository>(
        () => _i14.ConnectivityRepository(gh<_i5.Connectivity>()));
    gh.factory<_i15.ConnectivityCubit>(
        () => _i15.ConnectivityCubit(gh<_i13.IConnectivityRepository>()));
    gh.factory<_i16.UserLocationBloc>(() => _i16.UserLocationBloc(
          gh<_i9.IUserLocationRepository>(),
          gh<_i15.ConnectivityCubit>(),
        ));
    return this;
  }
}

class _$InjectableModule extends _i17.InjectableModule {}
