import 'package:freezed_annotation/freezed_annotation.dart';

part 'fund_transfer_response_model.freezed.dart';
part 'fund_transfer_response_model.g.dart';

@freezed
class FundTransferResponseModel with _$FundTransferResponseModel {
  const factory FundTransferResponseModel({
    required String status,
    required String message,
    required double amount,
    required double serviceChargeAmount,
    required double discountAmount,
    required String receiverName,
    required String receiverNumber,
  }) = _FundTransferResponseModel;

  factory FundTransferResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FundTransferResponseModelFromJson(json);
}
