import 'package:freezed_annotation/freezed_annotation.dart';

part 'loginResponseModel.freezed.dart';
part 'loginResponseModel.g.dart';

@freezed
class LoginResponseModel with _$LoginResponseModel {
  const factory LoginResponseModel({dynamic message, dynamic token}) =
      _LoginResponseModel;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
}

// @freezed
// class Data with _$Data {
//   const factory Data({
//     dynamic token,
//   }) = _Data;

//   factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
// }
