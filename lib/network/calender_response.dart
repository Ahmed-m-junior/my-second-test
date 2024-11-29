import 'package:json_annotation/json_annotation.dart';
import 'package:your_app/network/calender.dart';
part 'calender_response.g.dart';

@JsonSerializable()
class CalenderResponse {
  int? code;
  String? status;
  List<Calender>? data;
  CalenderResponse({this.code, this.status, this.data});

  factory CalenderResponse.fromJson(Map<String, dynamic> json) =>
      _$CalenderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CalenderResponseToJson(this);
}
