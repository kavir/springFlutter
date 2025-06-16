// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'editUserProfileRequestModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EditUserProfileModel _$EditUserProfileModelFromJson(Map<String, dynamic> json) {
  return _EditUserProfileModel.fromJson(json);
}

/// @nodoc
mixin _$EditUserProfileModel {
  dynamic get number => throw _privateConstructorUsedError;
  dynamic get firstName => throw _privateConstructorUsedError;
  dynamic get lastName => throw _privateConstructorUsedError;
  dynamic get editedNumber => throw _privateConstructorUsedError;
  dynamic get ProfilePicture => throw _privateConstructorUsedError;

  /// Serializes this EditUserProfileModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EditUserProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EditUserProfileModelCopyWith<EditUserProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditUserProfileModelCopyWith<$Res> {
  factory $EditUserProfileModelCopyWith(EditUserProfileModel value,
          $Res Function(EditUserProfileModel) then) =
      _$EditUserProfileModelCopyWithImpl<$Res, EditUserProfileModel>;
  @useResult
  $Res call(
      {dynamic number,
      dynamic firstName,
      dynamic lastName,
      dynamic editedNumber,
      dynamic ProfilePicture});
}

/// @nodoc
class _$EditUserProfileModelCopyWithImpl<$Res,
        $Val extends EditUserProfileModel>
    implements $EditUserProfileModelCopyWith<$Res> {
  _$EditUserProfileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EditUserProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? editedNumber = freezed,
    Object? ProfilePicture = freezed,
  }) {
    return _then(_value.copyWith(
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as dynamic,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      editedNumber: freezed == editedNumber
          ? _value.editedNumber
          : editedNumber // ignore: cast_nullable_to_non_nullable
              as dynamic,
      ProfilePicture: freezed == ProfilePicture
          ? _value.ProfilePicture
          : ProfilePicture // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditUserProfileModelImplCopyWith<$Res>
    implements $EditUserProfileModelCopyWith<$Res> {
  factory _$$EditUserProfileModelImplCopyWith(_$EditUserProfileModelImpl value,
          $Res Function(_$EditUserProfileModelImpl) then) =
      __$$EditUserProfileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic number,
      dynamic firstName,
      dynamic lastName,
      dynamic editedNumber,
      dynamic ProfilePicture});
}

/// @nodoc
class __$$EditUserProfileModelImplCopyWithImpl<$Res>
    extends _$EditUserProfileModelCopyWithImpl<$Res, _$EditUserProfileModelImpl>
    implements _$$EditUserProfileModelImplCopyWith<$Res> {
  __$$EditUserProfileModelImplCopyWithImpl(_$EditUserProfileModelImpl _value,
      $Res Function(_$EditUserProfileModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditUserProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? editedNumber = freezed,
    Object? ProfilePicture = freezed,
  }) {
    return _then(_$EditUserProfileModelImpl(
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as dynamic,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      editedNumber: freezed == editedNumber
          ? _value.editedNumber
          : editedNumber // ignore: cast_nullable_to_non_nullable
              as dynamic,
      ProfilePicture: freezed == ProfilePicture
          ? _value.ProfilePicture
          : ProfilePicture // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EditUserProfileModelImpl implements _EditUserProfileModel {
  const _$EditUserProfileModelImpl(
      {this.number,
      this.firstName,
      this.lastName,
      this.editedNumber,
      this.ProfilePicture});

  factory _$EditUserProfileModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EditUserProfileModelImplFromJson(json);

  @override
  final dynamic number;
  @override
  final dynamic firstName;
  @override
  final dynamic lastName;
  @override
  final dynamic editedNumber;
  @override
  final dynamic ProfilePicture;

  @override
  String toString() {
    return 'EditUserProfileModel(number: $number, firstName: $firstName, lastName: $lastName, editedNumber: $editedNumber, ProfilePicture: $ProfilePicture)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditUserProfileModelImpl &&
            const DeepCollectionEquality().equals(other.number, number) &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality()
                .equals(other.editedNumber, editedNumber) &&
            const DeepCollectionEquality()
                .equals(other.ProfilePicture, ProfilePicture));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(number),
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(lastName),
      const DeepCollectionEquality().hash(editedNumber),
      const DeepCollectionEquality().hash(ProfilePicture));

  /// Create a copy of EditUserProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditUserProfileModelImplCopyWith<_$EditUserProfileModelImpl>
      get copyWith =>
          __$$EditUserProfileModelImplCopyWithImpl<_$EditUserProfileModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EditUserProfileModelImplToJson(
      this,
    );
  }
}

abstract class _EditUserProfileModel implements EditUserProfileModel {
  const factory _EditUserProfileModel(
      {final dynamic number,
      final dynamic firstName,
      final dynamic lastName,
      final dynamic editedNumber,
      final dynamic ProfilePicture}) = _$EditUserProfileModelImpl;

  factory _EditUserProfileModel.fromJson(Map<String, dynamic> json) =
      _$EditUserProfileModelImpl.fromJson;

  @override
  dynamic get number;
  @override
  dynamic get firstName;
  @override
  dynamic get lastName;
  @override
  dynamic get editedNumber;
  @override
  dynamic get ProfilePicture;

  /// Create a copy of EditUserProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditUserProfileModelImplCopyWith<_$EditUserProfileModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
