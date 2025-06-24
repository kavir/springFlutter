import 'package:freezed_annotation/freezed_annotation.dart';

part 'editUserProfileRequestModel.freezed.dart';
part 'editUserProfileRequestModel.g.dart';

@freezed
class EditUserProfileModel with _$EditUserProfileModel {
  const factory EditUserProfileModel({
    dynamic number,
    dynamic firstName,
    dynamic lastName,
    dynamic editedNumber,
    dynamic ProfilePicture,
  }) = _EditUserProfileModel;

  factory EditUserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$EditUserProfileModelFromJson(json);
}
