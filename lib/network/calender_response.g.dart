// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calender_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalenderResponse _$CalenderResponseFromJson(Map<String, dynamic> json) =>
    CalenderResponse(
      code: json['code'] as int?,
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Calender.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CalenderResponseToJson(CalenderResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data,
    };
