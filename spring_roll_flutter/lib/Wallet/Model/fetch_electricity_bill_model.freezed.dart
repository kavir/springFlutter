// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fetch_electricity_bill_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FetchElectricityBillModel _$FetchElectricityBillModelFromJson(
    Map<String, dynamic> json) {
  return _FetchElectricityBillModel.fromJson(json);
}

/// @nodoc
mixin _$FetchElectricityBillModel {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get billDate => throw _privateConstructorUsedError;
  double get unitsConsumed => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  bool get paid => throw _privateConstructorUsedError;

  /// Serializes this FetchElectricityBillModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FetchElectricityBillModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FetchElectricityBillModelCopyWith<FetchElectricityBillModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchElectricityBillModelCopyWith<$Res> {
  factory $FetchElectricityBillModelCopyWith(FetchElectricityBillModel value,
          $Res Function(FetchElectricityBillModel) then) =
      _$FetchElectricityBillModelCopyWithImpl<$Res, FetchElectricityBillModel>;
  @useResult
  $Res call(
      {int id,
      int userId,
      String billDate,
      double unitsConsumed,
      double amount,
      bool paid});
}

/// @nodoc
class _$FetchElectricityBillModelCopyWithImpl<$Res,
        $Val extends FetchElectricityBillModel>
    implements $FetchElectricityBillModelCopyWith<$Res> {
  _$FetchElectricityBillModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FetchElectricityBillModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? billDate = null,
    Object? unitsConsumed = null,
    Object? amount = null,
    Object? paid = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      billDate: null == billDate
          ? _value.billDate
          : billDate // ignore: cast_nullable_to_non_nullable
              as String,
      unitsConsumed: null == unitsConsumed
          ? _value.unitsConsumed
          : unitsConsumed // ignore: cast_nullable_to_non_nullable
              as double,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      paid: null == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchElectricityBillModelImplCopyWith<$Res>
    implements $FetchElectricityBillModelCopyWith<$Res> {
  factory _$$FetchElectricityBillModelImplCopyWith(
          _$FetchElectricityBillModelImpl value,
          $Res Function(_$FetchElectricityBillModelImpl) then) =
      __$$FetchElectricityBillModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int userId,
      String billDate,
      double unitsConsumed,
      double amount,
      bool paid});
}

/// @nodoc
class __$$FetchElectricityBillModelImplCopyWithImpl<$Res>
    extends _$FetchElectricityBillModelCopyWithImpl<$Res,
        _$FetchElectricityBillModelImpl>
    implements _$$FetchElectricityBillModelImplCopyWith<$Res> {
  __$$FetchElectricityBillModelImplCopyWithImpl(
      _$FetchElectricityBillModelImpl _value,
      $Res Function(_$FetchElectricityBillModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FetchElectricityBillModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? billDate = null,
    Object? unitsConsumed = null,
    Object? amount = null,
    Object? paid = null,
  }) {
    return _then(_$FetchElectricityBillModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      billDate: null == billDate
          ? _value.billDate
          : billDate // ignore: cast_nullable_to_non_nullable
              as String,
      unitsConsumed: null == unitsConsumed
          ? _value.unitsConsumed
          : unitsConsumed // ignore: cast_nullable_to_non_nullable
              as double,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      paid: null == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FetchElectricityBillModelImpl implements _FetchElectricityBillModel {
  _$FetchElectricityBillModelImpl(
      {required this.id,
      required this.userId,
      required this.billDate,
      required this.unitsConsumed,
      required this.amount,
      required this.paid});

  factory _$FetchElectricityBillModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FetchElectricityBillModelImplFromJson(json);

  @override
  final int id;
  @override
  final int userId;
  @override
  final String billDate;
  @override
  final double unitsConsumed;
  @override
  final double amount;
  @override
  final bool paid;

  @override
  String toString() {
    return 'FetchElectricityBillModel(id: $id, userId: $userId, billDate: $billDate, unitsConsumed: $unitsConsumed, amount: $amount, paid: $paid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchElectricityBillModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.billDate, billDate) ||
                other.billDate == billDate) &&
            (identical(other.unitsConsumed, unitsConsumed) ||
                other.unitsConsumed == unitsConsumed) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.paid, paid) || other.paid == paid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, billDate, unitsConsumed, amount, paid);

  /// Create a copy of FetchElectricityBillModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchElectricityBillModelImplCopyWith<_$FetchElectricityBillModelImpl>
      get copyWith => __$$FetchElectricityBillModelImplCopyWithImpl<
          _$FetchElectricityBillModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FetchElectricityBillModelImplToJson(
      this,
    );
  }
}

abstract class _FetchElectricityBillModel implements FetchElectricityBillModel {
  factory _FetchElectricityBillModel(
      {required final int id,
      required final int userId,
      required final String billDate,
      required final double unitsConsumed,
      required final double amount,
      required final bool paid}) = _$FetchElectricityBillModelImpl;

  factory _FetchElectricityBillModel.fromJson(Map<String, dynamic> json) =
      _$FetchElectricityBillModelImpl.fromJson;

  @override
  int get id;
  @override
  int get userId;
  @override
  String get billDate;
  @override
  double get unitsConsumed;
  @override
  double get amount;
  @override
  bool get paid;

  /// Create a copy of FetchElectricityBillModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchElectricityBillModelImplCopyWith<_$FetchElectricityBillModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
