// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Timing _$TimingFromJson(Map<String, dynamic> json) => Timing(
      Fajr: json['Fajr'] as String?,
      Sunrise: json['Sunrise'] as String?,
      Dhuhr: json['Dhuhr'] as String?,
      Asr: json['Asr'] as String?,
      Isha: json['Isha'] as String?,
      Maghrib: json['Maghrib'] as String?,
    );

Map<String, dynamic> _$TimingToJson(Timing instance) => <String, dynamic>{
      'Fajr': instance.Fajr,
      'Sunrise': instance.Sunrise,
      'Dhuhr': instance.Dhuhr,
      'Asr': instance.Asr,
      'Maghrib': instance.Maghrib,
      'Isha': instance.Isha,
    };
