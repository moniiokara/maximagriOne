// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
      operationsUID: json['operationsUID'] as String,
      zonalManagerUID: json['zonalManagerUID'] as String,
      salesManagerUID: json['salesManagerUID'] as String,
      salesOfficerUID: json['salesOfficerUID'] as String,
      userUID: json['userUID'] as String,
      userName: json['userName'] as String,
      userCNIC: json['userCNIC'] as String,
      userType: json['userType'] as String,
      userMobile: json['userMobile'] as String,
      userStatus: json['userStatus'] as bool,
      userAddress:
          UserAddress.fromJson(json['userAddress'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'userUID': instance.userUID,
      'userName': instance.userName,
      'userCNIC': instance.userCNIC,
      'userType': instance.userType,
      'userMobile': instance.userMobile,
      'userStatus': instance.userStatus,
      'userAddress': instance.userAddress.toJson(),
      'operationsUID': instance.operationsUID,
      'zonalManagerUID': instance.zonalManagerUID,
      'salesManagerUID': instance.salesManagerUID,
      'salesOfficerUID': instance.salesOfficerUID,
    };
