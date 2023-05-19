import 'package:json_annotation/json_annotation.dart';
part 'district_model.g.dart';

@JsonSerializable()
class District {
  String districtName;
  List<String> tehsilsList;
  District({
    required this.districtName,
    required this.tehsilsList,
  });
  factory District.fromJson(Map<String, dynamic> json) =>
      _$DistrictFromJson(json);
  Map<String, dynamic> toJson() => _$DistrictToJson(this);
}
