import 'package:freezed_annotation/freezed_annotation.dart';

part 'loginRequestModel.freezed.dart';
part 'loginRequestModel.g.dart';

@freezed
class LoginRequestModel with _$LoginRequestModel {
  const factory LoginRequestModel({
    dynamic number,
    dynamic password,
  }) = _LoginRequestModel;

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);
}
