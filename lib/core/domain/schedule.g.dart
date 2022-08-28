// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Schedule _$ScheduleFromJson(Map<String, dynamic> json) => Schedule(
      data: (json['data'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            DateTime.parse(k),
            (e as List<dynamic>)
                .map((e) => Talk.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
    );

Map<String, dynamic> _$ScheduleToJson(Schedule instance) => <String, dynamic>{
      'data': instance.data.map((k, e) => MapEntry(k.toIso8601String(), e)),
    };
