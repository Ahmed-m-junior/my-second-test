// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calender.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Calender _$CalenderFromJson(Map<String, dynamic> json) => Calender(
      timings: json['timings'] == null
          ? null
          : Timing.fromJson(json['timings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CalenderToJson(Calender instance) => <String, dynamic>{
      'timings': instance.timings,
    };
