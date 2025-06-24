import 'package:freezed_annotation/freezed_annotation.dart';

part 'TransferModel.freezed.dart';
part 'TransferModel.g.dart';

@freezed
class TransferDataModel with _$TransferDataModel {
  const factory TransferDataModel({
    // dynamic id,
    dynamic senderNumber,
    dynamic receiverNumber,
    dynamic amount,
  }) = _TransferDataModel;

  factory TransferDataModel.fromJson(Map<String, dynamic> json) =>
      _$TransferDataModelFromJson(json);
}
