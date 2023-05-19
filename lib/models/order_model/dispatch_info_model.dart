import 'package:json_annotation/json_annotation.dart';
part 'dispatch_info_model.g.dart';

@JsonSerializable()
class DispatchInfo {
  String driverContact;
  String vehicleNo;
  DateTime dispatchTime;
  DispatchInfo({
    required this.driverContact,
    required this.vehicleNo,
    required this.dispatchTime,
  });
  factory DispatchInfo.fromJson(Map<String, dynamic> json) =>
      _$DispatchInfoFromJson(json);
  Map<String, dynamic> toJson() => _$DispatchInfoToJson(this);
}
