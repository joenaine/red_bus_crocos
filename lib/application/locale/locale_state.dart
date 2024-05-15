part of 'locale_bloc.dart';

@freezed
class LocaleState with _$LocaleState {
  const factory LocaleState({required Locale locale}) = _LocaleState;
  const factory LocaleState.initial(Locale locale) = _Initial;
}
