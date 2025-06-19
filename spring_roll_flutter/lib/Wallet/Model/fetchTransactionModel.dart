import 'package:freezed_annotation/freezed_annotation.dart';

part 'fetchTransactionModel.freezed.dart';
part 'fetchTransactionModel.g.dart';

@freezed
class TransactionModel with _$TransactionModel {
  factory TransactionModel({
    required int id,
    required String senderName,
    required String receiverName,
    required double amount,
    required double serviceChargeAmount,
    required String timestamp,
    required String status,
    required String transactionRole,
    required String phoneNumber,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);
}
