import 'package:freezed_annotation/freezed_annotation.dart';

part 'fetch_indv_user_model.freezed.dart';
part 'fetch_indv_user_model.g.dart';

@freezed
class FetchIndvUserDataModel with _$FetchIndvUserDataModel {
  const factory FetchIndvUserDataModel({
    dynamic userId,
    dynamic userName,
    dynamic userPhoneNumber,
    dynamic walletBalance,
  }) = _FetchIndvUserDataModel;

  factory FetchIndvUserDataModel.fromJson(Map<String, dynamic> json) =>
      _$FetchIndvUserDataModelFromJson(json);
}
