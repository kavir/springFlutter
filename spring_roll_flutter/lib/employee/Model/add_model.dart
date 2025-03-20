import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_model.freezed.dart';
part 'add_model.g.dart';

@freezed
class AddDataModel with _$AddDataModel {
  const factory AddDataModel({
    // dynamic id,
    dynamic name,
    dynamic email,
    dynamic phone,
  }) = _AddDataModel;

  factory AddDataModel.fromJson(Map<String, dynamic> json) =>
      _$AddDataModelFromJson(json);
}
