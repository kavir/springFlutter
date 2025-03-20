// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fetch_indv_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FetchIndvUserDataModel _$FetchIndvUserDataModelFromJson(
    Map<String, dynamic> json) {
  return _FetchIndvUserDataModel.fromJson(json);
}

/// @nodoc
mixin _$FetchIndvUserDataModel {
  dynamic get userId => throw _privateConstructorUsedError;
  dynamic get userName => throw _privateConstructorUsedError;
  dynamic get userPhoneNumber => throw _privateConstructorUsedError;
  dynamic get walletBalance => throw _privateConstructorUsedError;

  /// Serializes this FetchIndvUserDataModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FetchIndvUserDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FetchIndvUserDataModelCopyWith<FetchIndvUserDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchIndvUserDataModelCopyWith<$Res> {
  factory $FetchIndvUserDataModelCopyWith(FetchIndvUserDataModel value,
          $Res Function(FetchIndvUserDataModel) then) =
      _$FetchIndvUserDataModelCopyWithImpl<$Res, FetchIndvUserDataModel>;
  @useResult
  $Res call(
      {dynamic userId,
      dynamic userName,
      dynamic userPhoneNumber,
      dynamic walletBalance});
}

/// @nodoc
class _$FetchIndvUserDataModelCopyWithImpl<$Res,
        $Val extends FetchIndvUserDataModel>
    implements $FetchIndvUserDataModelCopyWith<$Res> {
  _$FetchIndvUserDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FetchIndvUserDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? userName = freezed,
    Object? userPhoneNumber = freezed,
    Object? walletBalance = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      userPhoneNumber: freezed == userPhoneNumber
          ? _value.userPhoneNumber
          : userPhoneNumber // ignore: cast_nullable_to_non_nullable
              as dynamic,
      walletBalance: freezed == walletBalance
          ? _value.walletBalance
          : walletBalance // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchIndvUserDataModelImplCopyWith<$Res>
    implements $FetchIndvUserDataModelCopyWith<$Res> {
  factory _$$FetchIndvUserDataModelImplCopyWith(
          _$FetchIndvUserDataModelImpl value,
          $Res Function(_$FetchIndvUserDataModelImpl) then) =
      __$$FetchIndvUserDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic userId,
      dynamic userName,
      dynamic userPhoneNumber,
      dynamic walletBalance});
}

/// @nodoc
class __$$FetchIndvUserDataModelImplCopyWithImpl<$Res>
    extends _$FetchIndvUserDataModelCopyWithImpl<$Res,
        _$FetchIndvUserDataModelImpl>
    implements _$$FetchIndvUserDataModelImplCopyWith<$Res> {
  __$$FetchIndvUserDataModelImplCopyWithImpl(
      _$FetchIndvUserDataModelImpl _value,
      $Res Function(_$FetchIndvUserDataModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FetchIndvUserDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? userName = freezed,
    Object? userPhoneNumber = freezed,
    Object? walletBalance = freezed,
  }) {
    return _then(_$FetchIndvUserDataModelImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      userPhoneNumber: freezed == userPhoneNumber
          ? _value.userPhoneNumber
          : userPhoneNumber // ignore: cast_nullable_to_non_nullable
              as dynamic,
      walletBalance: freezed == walletBalance
          ? _value.walletBalance
          : walletBalance // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FetchIndvUserDataModelImpl implements _FetchIndvUserDataModel {
  const _$FetchIndvUserDataModelImpl(
      {this.userId, this.userName, this.userPhoneNumber, this.walletBalance});

  factory _$FetchIndvUserDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FetchIndvUserDataModelImplFromJson(json);

  @override
  final dynamic userId;
  @override
  final dynamic userName;
  @override
  final dynamic userPhoneNumber;
  @override
  final dynamic walletBalance;

  @override
  String toString() {
    return 'FetchIndvUserDataModel(userId: $userId, userName: $userName, userPhoneNumber: $userPhoneNumber, walletBalance: $walletBalance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchIndvUserDataModelImpl &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality()
                .equals(other.userPhoneNumber, userPhoneNumber) &&
            const DeepCollectionEquality()
                .equals(other.walletBalance, walletBalance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(userPhoneNumber),
      const DeepCollectionEquality().hash(walletBalance));

  /// Create a copy of FetchIndvUserDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchIndvUserDataModelImplCopyWith<_$FetchIndvUserDataModelImpl>
      get copyWith => __$$FetchIndvUserDataModelImplCopyWithImpl<
          _$FetchIndvUserDataModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FetchIndvUserDataModelImplToJson(
      this,
    );
  }
}

abstract class _FetchIndvUserDataModel implements FetchIndvUserDataModel {
  const factory _FetchIndvUserDataModel(
      {final dynamic userId,
      final dynamic userName,
      final dynamic userPhoneNumber,
      final dynamic walletBalance}) = _$FetchIndvUserDataModelImpl;

  factory _FetchIndvUserDataModel.fromJson(Map<String, dynamic> json) =
      _$FetchIndvUserDataModelImpl.fromJson;

  @override
  dynamic get userId;
  @override
  dynamic get userName;
  @override
  dynamic get userPhoneNumber;
  @override
  dynamic get walletBalance;

  /// Create a copy of FetchIndvUserDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchIndvUserDataModelImplCopyWith<_$FetchIndvUserDataModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
