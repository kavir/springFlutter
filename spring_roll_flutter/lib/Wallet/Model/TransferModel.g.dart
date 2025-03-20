// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TransferModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransferDataModelImpl _$$TransferDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransferDataModelImpl(
      senderNumber: json['senderNumber'],
      receiverNumber: json['receiverNumber'],
      amount: json['amount'],
    );

Map<String, dynamic> _$$TransferDataModelImplToJson(
        _$TransferDataModelImpl instance) =>
    <String, dynamic>{
      'senderNumber': instance.senderNumber,
      'receiverNumber': instance.receiverNumber,
      'amount': instance.amount,
    };
