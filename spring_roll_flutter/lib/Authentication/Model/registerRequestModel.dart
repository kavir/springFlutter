import 'package:freezed_annotation/freezed_annotation.dart';

part 'registerRequestModel.freezed.dart';
part 'registerRequestModel.g.dart';

@freezed
class RegisterRequestModel with _$RegisterRequestModel {
  const factory RegisterRequestModel({
    dynamic username,
    dynamic firstname,
    dynamic lastname,
    dynamic number,
    dynamic password,
    dynamic role,
  }) = _RegisterRequestModel;

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestModelFromJson(json);
}
