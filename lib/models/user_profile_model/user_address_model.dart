import 'package:json_annotation/json_annotation.dart';
part 'user_address_model.g.dart';

@JsonSerializable()
class UserAddress {
  String province;
  String district;
  String tehsil;
  UserAddress({
    required this.province,
    required this.district,
    required this.tehsil,
  });

  void updateUserAddress({
    required String newProvince,
    required String newDistrict,
    required String newTehsil,
  }) {
    province = newProvince;
    district = newDistrict;
    tehsil = newTehsil;
  }

  factory UserAddress.fromJson(Map<String, dynamic> json) =>
      _$UserAddressFromJson(json);
  Map<String, dynamic> toJson() => _$UserAddressToJson(this);
}
