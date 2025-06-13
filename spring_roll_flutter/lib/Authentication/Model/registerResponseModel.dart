import 'package:freezed_annotation/freezed_annotation.dart';

part 'registerResponseModel.freezed.dart';
part 'registerResponseModel.g.dart';

@freezed
class registerResponseModel with _$registerResponseModel {
  const factory registerResponseModel({
    dynamic message,
    dynamic token,
  }) = _registerResponseModel;

  factory registerResponseModel.fromJson(Map<String, dynamic> json) =>
      _$registerResponseModelFromJson(json);
}

// @freezed
// class Registerdata with _$Registerdata {
//   const factory Registerdata({
//     dynamic token,
//   }) = _Registerdata;

//   factory Registerdata.fromJson(Map<String, dynamic> json) =>
//       _$RegisterdataFromJson(json);
// }
