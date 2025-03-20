// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fund_transfer_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FundTransferResponseModelImpl _$$FundTransferResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FundTransferResponseModelImpl(
      status: json['status'] as String,
      message: json['message'] as String,
      amount: (json['amount'] as num).toDouble(),
      receiverName: json['receiverName'] as String,
      receiverNumber: json['receiverNumber'] as String,
    );

Map<String, dynamic> _$$FundTransferResponseModelImplToJson(
        _$FundTransferResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'amount': instance.amount,
      'receiverName': instance.receiverName,
      'receiverNumber': instance.receiverNumber,
    };
