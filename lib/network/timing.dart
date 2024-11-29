import 'package:json_annotation/json_annotation.dart';
part 'timing.g.dart';
@JsonSerializable()
class Timing {
  String? Fajr;
  String? Sunrise;
  String? Dhuhr;
  String? Asr;
  String? Sunset;
  String? Maghrib;
  String? Isha;
  String? Midnight;
  Timing(
      {this.Fajr, this.Sunrise, this.Dhuhr, this.Asr,this.Sunset, this.Maghrib, this.Isha,this.Midnight});

  factory Timing.fromJson(Map<String, dynamic> json) =>
      _$TimingFromJson(json);

  Map<String, dynamic> toJson() => _$TimingToJson(this);
}
