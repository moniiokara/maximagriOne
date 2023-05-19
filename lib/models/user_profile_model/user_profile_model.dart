import 'package:json_annotation/json_annotation.dart';
import 'package:maximagri/models/user_profile_model/user_address_model.dart';

part 'user_profile_model.g.dart';

@JsonSerializable()
class UserProfile {
  String userUID;
  String userName;
  String userCNIC;
  String userType;
  String userMobile;
  bool userStatus;
  UserAddress userAddress;
  String operationsUID;
  String zonalManagerUID;
  String salesManagerUID;
  String salesOfficerUID;
  UserProfile({
    required this.userUID,
    required this.userName,
    required this.userCNIC,
    required this.userType,
    required this.userMobile,
    required this.userStatus,
    required this.userAddress,
    required this.operationsUID,
    required this.zonalManagerUID,
    required this.salesManagerUID,
    required this.salesOfficerUID,
  });

  updateUserProfile({
    required String newUserName,
    required String newUserCNIC,
  }) {
    userName = newUserName;
    userCNIC = newUserCNIC;
  }

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}
