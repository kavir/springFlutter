import 'package:freezed_annotation/freezed_annotation.dart';
part 'appState.freezed.dart';

@freezed
class AppState<T> with _$AppState<T> {
  const factory AppState.initial() = Initial;
  const factory AppState.loading({bool? loading}) = Loading;
  const factory AppState.success({T? data}) = Success<T>;
  const factory AppState.error({T? data}) = Error<T>;
  const factory AppState.generalError({String? errorMessage}) = LoginError;
}
