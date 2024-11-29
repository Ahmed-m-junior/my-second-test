import 'package:json_annotation/json_annotation.dart';
import 'package:your_app/network/timing.dart';
part 'calender.g.dart';


@JsonSerializable()
class Calender {
  Timing? timings;
  Calender({this.timings});

  factory Calender.fromJson(Map<String, dynamic> json) =>
      _$CalenderFromJson(json);

  Map<String, dynamic> toJson() => _$CalenderToJson(this);
}
