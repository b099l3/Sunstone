// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speaker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Speaker _$SpeakerFromJson(Map<String, dynamic> json) => Speaker(
      name: json['name'] as String,
      subtitle: json['subtitle'] as String,
      imageUrl: json['imageUrl'] as String,
      twitter: json['twitter'] as String?,
      linkedIn: json['linkedIn'] as String?,
    );

Map<String, dynamic> _$SpeakerToJson(Speaker instance) => <String, dynamic>{
      'name': instance.name,
      'subtitle': instance.subtitle,
      'imageUrl': instance.imageUrl,
      'twitter': instance.twitter,
      'linkedIn': instance.linkedIn,
    };
