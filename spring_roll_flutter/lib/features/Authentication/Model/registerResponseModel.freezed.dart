// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registerResponseModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

registerResponseModel _$registerResponseModelFromJson(
    Map<String, dynamic> json) {
  return _registerResponseModel.fromJson(json);
}

/// @nodoc
mixin _$registerResponseModel {
  dynamic get message => throw _privateConstructorUsedError;
  dynamic get token => throw _privateConstructorUsedError;

  /// Serializes this registerResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of registerResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $registerResponseModelCopyWith<registerResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $registerResponseModelCopyWith<$Res> {
  factory $registerResponseModelCopyWith(registerResponseModel value,
          $Res Function(registerResponseModel) then) =
      _$registerResponseModelCopyWithImpl<$Res, registerResponseModel>;
  @useResult
  $Res call({dynamic message, dynamic token});
}

/// @nodoc
class _$registerResponseModelCopyWithImpl<$Res,
        $Val extends registerResponseModel>
    implements $registerResponseModelCopyWith<$Res> {
  _$registerResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of registerResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as dynamic,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$registerResponseModelImplCopyWith<$Res>
    implements $registerResponseModelCopyWith<$Res> {
  factory _$$registerResponseModelImplCopyWith(
          _$registerResponseModelImpl value,
          $Res Function(_$registerResponseModelImpl) then) =
      __$$registerResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic message, dynamic token});
}

/// @nodoc
class __$$registerResponseModelImplCopyWithImpl<$Res>
    extends _$registerResponseModelCopyWithImpl<$Res,
        _$registerResponseModelImpl>
    implements _$$registerResponseModelImplCopyWith<$Res> {
  __$$registerResponseModelImplCopyWithImpl(_$registerResponseModelImpl _value,
      $Res Function(_$registerResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of registerResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? token = freezed,
  }) {
    return _then(_$registerResponseModelImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as dynamic,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$registerResponseModelImpl implements _registerResponseModel {
  const _$registerResponseModelImpl({this.message, this.token});

  factory _$registerResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$registerResponseModelImplFromJson(json);

  @override
  final dynamic message;
  @override
  final dynamic token;

  @override
  String toString() {
    return 'registerResponseModel(message: $message, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$registerResponseModelImpl &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.token, token));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(token));

  /// Create a copy of registerResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$registerResponseModelImplCopyWith<_$registerResponseModelImpl>
      get copyWith => __$$registerResponseModelImplCopyWithImpl<
          _$registerResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$registerResponseModelImplToJson(
      this,
    );
  }
}

abstract class _registerResponseModel implements registerResponseModel {
  const factory _registerResponseModel(
      {final dynamic message,
      final dynamic token}) = _$registerResponseModelImpl;

  factory _registerResponseModel.fromJson(Map<String, dynamic> json) =
      _$registerResponseModelImpl.fromJson;

  @override
  dynamic get message;
  @override
  dynamic get token;

  /// Create a copy of registerResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$registerResponseModelImplCopyWith<_$registerResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
