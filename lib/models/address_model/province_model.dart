import 'package:json_annotation/json_annotation.dart';
import 'package:maximagri/models/address_model/district_model.dart';
part 'province_model.g.dart';

@JsonSerializable()
class Province {
  String provinceName;
  List<District> districtsList;
  Province({required this.provinceName, required this.districtsList});
  factory Province.fromJson(Map<String, dynamic> json) =>
      _$ProvinceFromJson(json);
  Map<String, dynamic> toJson() => _$ProvinceToJson(this);
}
