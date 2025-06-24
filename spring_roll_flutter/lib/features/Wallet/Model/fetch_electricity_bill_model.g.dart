// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_electricity_bill_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FetchElectricityBillModelImpl _$$FetchElectricityBillModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FetchElectricityBillModelImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      billDate: json['billDate'] as String,
      unitsConsumed: (json['unitsConsumed'] as num).toDouble(),
      amount: (json['amount'] as num).toDouble(),
      paid: json['paid'] as bool,
    );

Map<String, dynamic> _$$FetchElectricityBillModelImplToJson(
        _$FetchElectricityBillModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'billDate': instance.billDate,
      'unitsConsumed': instance.unitsConsumed,
      'amount': instance.amount,
      'paid': instance.paid,
    };
