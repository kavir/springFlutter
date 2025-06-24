// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'TransferModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransferDataModel _$TransferDataModelFromJson(Map<String, dynamic> json) {
  return _TransferDataModel.fromJson(json);
}

/// @nodoc
mixin _$TransferDataModel {
// dynamic id,
  dynamic get senderNumber => throw _privateConstructorUsedError;
  dynamic get receiverNumber => throw _privateConstructorUsedError;
  dynamic get amount => throw _privateConstructorUsedError;

  /// Serializes this TransferDataModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransferDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransferDataModelCopyWith<TransferDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferDataModelCopyWith<$Res> {
  factory $TransferDataModelCopyWith(
          TransferDataModel value, $Res Function(TransferDataModel) then) =
      _$TransferDataModelCopyWithImpl<$Res, TransferDataModel>;
  @useResult
  $Res call({dynamic senderNumber, dynamic receiverNumber, dynamic amount});
}

/// @nodoc
class _$TransferDataModelCopyWithImpl<$Res, $Val extends TransferDataModel>
    implements $TransferDataModelCopyWith<$Res> {
  _$TransferDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransferDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderNumber = freezed,
    Object? receiverNumber = freezed,
    Object? amount = freezed,
  }) {
    return _then(_value.copyWith(
      senderNumber: freezed == senderNumber
          ? _value.senderNumber
          : senderNumber // ignore: cast_nullable_to_non_nullable
              as dynamic,
      receiverNumber: freezed == receiverNumber
          ? _value.receiverNumber
          : receiverNumber // ignore: cast_nullable_to_non_nullable
              as dynamic,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransferDataModelImplCopyWith<$Res>
    implements $TransferDataModelCopyWith<$Res> {
  factory _$$TransferDataModelImplCopyWith(_$TransferDataModelImpl value,
          $Res Function(_$TransferDataModelImpl) then) =
      __$$TransferDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic senderNumber, dynamic receiverNumber, dynamic amount});
}

/// @nodoc
class __$$TransferDataModelImplCopyWithImpl<$Res>
    extends _$TransferDataModelCopyWithImpl<$Res, _$TransferDataModelImpl>
    implements _$$TransferDataModelImplCopyWith<$Res> {
  __$$TransferDataModelImplCopyWithImpl(_$TransferDataModelImpl _value,
      $Res Function(_$TransferDataModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderNumber = freezed,
    Object? receiverNumber = freezed,
    Object? amount = freezed,
  }) {
    return _then(_$TransferDataModelImpl(
      senderNumber: freezed == senderNumber
          ? _value.senderNumber
          : senderNumber // ignore: cast_nullable_to_non_nullable
              as dynamic,
      receiverNumber: freezed == receiverNumber
          ? _value.receiverNumber
          : receiverNumber // ignore: cast_nullable_to_non_nullable
              as dynamic,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransferDataModelImpl implements _TransferDataModel {
  const _$TransferDataModelImpl(
      {this.senderNumber, this.receiverNumber, this.amount});

  factory _$TransferDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransferDataModelImplFromJson(json);

// dynamic id,
  @override
  final dynamic senderNumber;
  @override
  final dynamic receiverNumber;
  @override
  final dynamic amount;

  @override
  String toString() {
    return 'TransferDataModel(senderNumber: $senderNumber, receiverNumber: $receiverNumber, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferDataModelImpl &&
            const DeepCollectionEquality()
                .equals(other.senderNumber, senderNumber) &&
            const DeepCollectionEquality()
                .equals(other.receiverNumber, receiverNumber) &&
            const DeepCollectionEquality().equals(other.amount, amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(senderNumber),
      const DeepCollectionEquality().hash(receiverNumber),
      const DeepCollectionEquality().hash(amount));

  /// Create a copy of TransferDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransferDataModelImplCopyWith<_$TransferDataModelImpl> get copyWith =>
      __$$TransferDataModelImplCopyWithImpl<_$TransferDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransferDataModelImplToJson(
      this,
    );
  }
}

abstract class _TransferDataModel implements TransferDataModel {
  const factory _TransferDataModel(
      {final dynamic senderNumber,
      final dynamic receiverNumber,
      final dynamic amount}) = _$TransferDataModelImpl;

  factory _TransferDataModel.fromJson(Map<String, dynamic> json) =
      _$TransferDataModelImpl.fromJson;

// dynamic id,
  @override
  dynamic get senderNumber;
  @override
  dynamic get receiverNumber;
  @override
  dynamic get amount;

  /// Create a copy of TransferDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransferDataModelImplCopyWith<_$TransferDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
