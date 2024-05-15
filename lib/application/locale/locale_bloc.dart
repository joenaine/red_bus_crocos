import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:red_bus_crocos_project/core/theme/theme_global_var.dart'
    as global;
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'locale_event.dart';
part 'locale_state.dart';
part 'locale_bloc.freezed.dart';

@injectable
class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc() : super(_Initial(global.locale)) {
    on<LocaleEvent>((event, emit) {
      event.map(
        setLocale: (e) async {
          final sharedPref = await SharedPreferences.getInstance();
          sharedPref.setString('locale', e.locale.languageCode.substring(0, 2));
          global.locale = e.locale;
          emit(
            state.copyWith(
              locale: e.locale,
            ),
          );
        },
      );
      // TODO: implement event handler
    });
  }
}
