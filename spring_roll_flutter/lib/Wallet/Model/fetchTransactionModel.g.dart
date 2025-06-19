// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetchTransactionModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionModelImpl _$$TransactionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionModelImpl(
      id: (json['id'] as num).toInt(),
      senderName: json['senderName'] as String,
      receiverName: json['receiverName'] as String,
      amount: (json['amount'] as num).toDouble(),
      serviceChargeAmount: (json['serviceChargeAmount'] as num).toDouble(),
      timestamp: json['timestamp'] as String,
      status: json['status'] as String,
      transactionRole: json['transactionRole'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );

Map<String, dynamic> _$$TransactionModelImplToJson(
        _$TransactionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderName': instance.senderName,
      'receiverName': instance.receiverName,
      'amount': instance.amount,
      'serviceChargeAmount': instance.serviceChargeAmount,
      'timestamp': instance.timestamp,
      'status': instance.status,
      'transactionRole': instance.transactionRole,
      'phoneNumber': instance.phoneNumber,
    };
