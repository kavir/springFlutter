// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fund_transfer_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FundTransferResponseModel _$FundTransferResponseModelFromJson(
    Map<String, dynamic> json) {
  return _FundTransferResponseModel.fromJson(json);
}

/// @nodoc
mixin _$FundTransferResponseModel {
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  double get serviceChargeAmount => throw _privateConstructorUsedError;
  String get receiverName => throw _privateConstructorUsedError;
  String get receiverNumber => throw _privateConstructorUsedError;

  /// Serializes this FundTransferResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FundTransferResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FundTransferResponseModelCopyWith<FundTransferResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FundTransferResponseModelCopyWith<$Res> {
  factory $FundTransferResponseModelCopyWith(FundTransferResponseModel value,
          $Res Function(FundTransferResponseModel) then) =
      _$FundTransferResponseModelCopyWithImpl<$Res, FundTransferResponseModel>;
  @useResult
  $Res call(
      {String status,
      String message,
      double amount,
      double serviceChargeAmount,
      String receiverName,
      String receiverNumber});
}

/// @nodoc
class _$FundTransferResponseModelCopyWithImpl<$Res,
        $Val extends FundTransferResponseModel>
    implements $FundTransferResponseModelCopyWith<$Res> {
  _$FundTransferResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FundTransferResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? amount = null,
    Object? serviceChargeAmount = null,
    Object? receiverName = null,
    Object? receiverNumber = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      serviceChargeAmount: null == serviceChargeAmount
          ? _value.serviceChargeAmount
          : serviceChargeAmount // ignore: cast_nullable_to_non_nullable
              as double,
      receiverName: null == receiverName
          ? _value.receiverName
          : receiverName // ignore: cast_nullable_to_non_nullable
              as String,
      receiverNumber: null == receiverNumber
          ? _value.receiverNumber
          : receiverNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FundTransferResponseModelImplCopyWith<$Res>
    implements $FundTransferResponseModelCopyWith<$Res> {
  factory _$$FundTransferResponseModelImplCopyWith(
          _$FundTransferResponseModelImpl value,
          $Res Function(_$FundTransferResponseModelImpl) then) =
      __$$FundTransferResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      String message,
      double amount,
      double serviceChargeAmount,
      String receiverName,
      String receiverNumber});
}

/// @nodoc
class __$$FundTransferResponseModelImplCopyWithImpl<$Res>
    extends _$FundTransferResponseModelCopyWithImpl<$Res,
        _$FundTransferResponseModelImpl>
    implements _$$FundTransferResponseModelImplCopyWith<$Res> {
  __$$FundTransferResponseModelImplCopyWithImpl(
      _$FundTransferResponseModelImpl _value,
      $Res Function(_$FundTransferResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FundTransferResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? amount = null,
    Object? serviceChargeAmount = null,
    Object? receiverName = null,
    Object? receiverNumber = null,
  }) {
    return _then(_$FundTransferResponseModelImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      serviceChargeAmount: null == serviceChargeAmount
          ? _value.serviceChargeAmount
          : serviceChargeAmount // ignore: cast_nullable_to_non_nullable
              as double,
      receiverName: null == receiverName
          ? _value.receiverName
          : receiverName // ignore: cast_nullable_to_non_nullable
              as String,
      receiverNumber: null == receiverNumber
          ? _value.receiverNumber
          : receiverNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FundTransferResponseModelImpl implements _FundTransferResponseModel {
  const _$FundTransferResponseModelImpl(
      {required this.status,
      required this.message,
      required this.amount,
      required this.serviceChargeAmount,
      required this.receiverName,
      required this.receiverNumber});

  factory _$FundTransferResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FundTransferResponseModelImplFromJson(json);

  @override
  final String status;
  @override
  final String message;
  @override
  final double amount;
  @override
  final double serviceChargeAmount;
  @override
  final String receiverName;
  @override
  final String receiverNumber;

  @override
  String toString() {
    return 'FundTransferResponseModel(status: $status, message: $message, amount: $amount, serviceChargeAmount: $serviceChargeAmount, receiverName: $receiverName, receiverNumber: $receiverNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FundTransferResponseModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.serviceChargeAmount, serviceChargeAmount) ||
                other.serviceChargeAmount == serviceChargeAmount) &&
            (identical(other.receiverName, receiverName) ||
                other.receiverName == receiverName) &&
            (identical(other.receiverNumber, receiverNumber) ||
                other.receiverNumber == receiverNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, amount,
      serviceChargeAmount, receiverName, receiverNumber);

  /// Create a copy of FundTransferResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FundTransferResponseModelImplCopyWith<_$FundTransferResponseModelImpl>
      get copyWith => __$$FundTransferResponseModelImplCopyWithImpl<
          _$FundTransferResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FundTransferResponseModelImplToJson(
      this,
    );
  }
}

abstract class _FundTransferResponseModel implements FundTransferResponseModel {
  const factory _FundTransferResponseModel(
      {required final String status,
      required final String message,
      required final double amount,
      required final double serviceChargeAmount,
      required final String receiverName,
      required final String receiverNumber}) = _$FundTransferResponseModelImpl;

  factory _FundTransferResponseModel.fromJson(Map<String, dynamic> json) =
      _$FundTransferResponseModelImpl.fromJson;

  @override
  String get status;
  @override
  String get message;
  @override
  double get amount;
  @override
  double get serviceChargeAmount;
  @override
  String get receiverName;
  @override
  String get receiverNumber;

  /// Create a copy of FundTransferResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FundTransferResponseModelImplCopyWith<_$FundTransferResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
