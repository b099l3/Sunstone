// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'talk.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Talk _$TalkFromJson(Map<String, dynamic> json) => Talk(
      title: json['title'] as String,
      start: DateTime.parse(json['start'] as String),
      end: DateTime.parse(json['end'] as String),
      location: $enumDecode(_$LocationEnumMap, json['location']),
      link: json['link'] as String?,
      speakers: (json['speakers'] as List<dynamic>?)
          ?.map((e) => Speaker.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TalkToJson(Talk instance) => <String, dynamic>{
      'title': instance.title,
      'start': instance.start.toIso8601String(),
      'end': instance.end.toIso8601String(),
      'location': _$LocationEnumMap[instance.location]!,
      'link': instance.link,
      'speakers': instance.speakers,
    };

const _$LocationEnumMap = {
  Location.valhalla: 'valhalla',
  Location.thor: 'thor',
  Location.odin: 'odin',
  Location.other: 'other',
};
