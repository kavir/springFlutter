// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddDataModel _$AddDataModelFromJson(Map<String, dynamic> json) {
  return _AddDataModel.fromJson(json);
}

/// @nodoc
mixin _$AddDataModel {
// dynamic id,
  dynamic get name => throw _privateConstructorUsedError;
  dynamic get email => throw _privateConstructorUsedError;
  dynamic get phone => throw _privateConstructorUsedError;

  /// Serializes this AddDataModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddDataModelCopyWith<AddDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddDataModelCopyWith<$Res> {
  factory $AddDataModelCopyWith(
          AddDataModel value, $Res Function(AddDataModel) then) =
      _$AddDataModelCopyWithImpl<$Res, AddDataModel>;
  @useResult
  $Res call({dynamic name, dynamic email, dynamic phone});
}

/// @nodoc
class _$AddDataModelCopyWithImpl<$Res, $Val extends AddDataModel>
    implements $AddDataModelCopyWith<$Res> {
  _$AddDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as dynamic,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as dynamic,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddDataModelImplCopyWith<$Res>
    implements $AddDataModelCopyWith<$Res> {
  factory _$$AddDataModelImplCopyWith(
          _$AddDataModelImpl value, $Res Function(_$AddDataModelImpl) then) =
      __$$AddDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic name, dynamic email, dynamic phone});
}

/// @nodoc
class __$$AddDataModelImplCopyWithImpl<$Res>
    extends _$AddDataModelCopyWithImpl<$Res, _$AddDataModelImpl>
    implements _$$AddDataModelImplCopyWith<$Res> {
  __$$AddDataModelImplCopyWithImpl(
      _$AddDataModelImpl _value, $Res Function(_$AddDataModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
  }) {
    return _then(_$AddDataModelImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as dynamic,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as dynamic,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddDataModelImpl implements _AddDataModel {
  const _$AddDataModelImpl({this.name, this.email, this.phone});

  factory _$AddDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddDataModelImplFromJson(json);

// dynamic id,
  @override
  final dynamic name;
  @override
  final dynamic email;
  @override
  final dynamic phone;

  @override
  String toString() {
    return 'AddDataModel(name: $name, email: $email, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddDataModelImpl &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.phone, phone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(phone));

  /// Create a copy of AddDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddDataModelImplCopyWith<_$AddDataModelImpl> get copyWith =>
      __$$AddDataModelImplCopyWithImpl<_$AddDataModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddDataModelImplToJson(
      this,
    );
  }
}

abstract class _AddDataModel implements AddDataModel {
  const factory _AddDataModel(
      {final dynamic name,
      final dynamic email,
      final dynamic phone}) = _$AddDataModelImpl;

  factory _AddDataModel.fromJson(Map<String, dynamic> json) =
      _$AddDataModelImpl.fromJson;

// dynamic id,
  @override
  dynamic get name;
  @override
  dynamic get email;
  @override
  dynamic get phone;

  /// Create a copy of AddDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddDataModelImplCopyWith<_$AddDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
