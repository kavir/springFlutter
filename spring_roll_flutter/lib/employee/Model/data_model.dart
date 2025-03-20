import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_model.freezed.dart';
part 'data_model.g.dart';

@freezed
class DataModel with _$DataModel {
  const factory DataModel({
    dynamic id,
    dynamic name,
    dynamic email,
    dynamic phone,
  }) = _DataModel;

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);

  static List<DataModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((e) => DataModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
