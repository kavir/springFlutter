// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_indv_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FetchIndvUserDataModelImpl _$$FetchIndvUserDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FetchIndvUserDataModelImpl(
      userId: json['userId'],
      userName: json['userName'],
      userPhoneNumber: json['userPhoneNumber'],
      userProfile: json['userProfile'],
      walletBalance: json['walletBalance'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );

Map<String, dynamic> _$$FetchIndvUserDataModelImplToJson(
        _$FetchIndvUserDataModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'userPhoneNumber': instance.userPhoneNumber,
      'userProfile': instance.userProfile,
      'walletBalance': instance.walletBalance,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
