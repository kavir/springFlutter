import 'package:freezed_annotation/freezed_annotation.dart';

part 'fetch_electricity_bill_model.freezed.dart';
part 'fetch_electricity_bill_model.g.dart';

@freezed
class FetchElectricityBillModel with _$FetchElectricityBillModel {
  factory FetchElectricityBillModel({
    required int id,
    required int userId,
    required String billDate,
    required double unitsConsumed,
    required double amount,
    required bool paid,
  }) = _FetchElectricityBillModel;

  factory FetchElectricityBillModel.fromJson(Map<String, dynamic> json) =>
      _$FetchElectricityBillModelFromJson(json);
}
