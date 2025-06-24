// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'editUserProfileRequestModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EditUserProfileModelImpl _$$EditUserProfileModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EditUserProfileModelImpl(
      number: json['number'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      editedNumber: json['editedNumber'],
      ProfilePicture: json['ProfilePicture'],
    );

Map<String, dynamic> _$$EditUserProfileModelImplToJson(
        _$EditUserProfileModelImpl instance) =>
    <String, dynamic>{
      'number': instance.number,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'editedNumber': instance.editedNumber,
      'ProfilePicture': instance.ProfilePicture,
    };
