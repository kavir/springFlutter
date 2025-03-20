// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registerRequestModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterRequestModelImpl _$$RegisterRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RegisterRequestModelImpl(
      username: json['username'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      number: json['number'],
      password: json['password'],
      role: json['role'],
    );

Map<String, dynamic> _$$RegisterRequestModelImplToJson(
        _$RegisterRequestModelImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'number': instance.number,
      'password': instance.password,
      'role': instance.role,
    };
