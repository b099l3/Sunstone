import 'package:json_annotation/json_annotation.dart';

import 'location.dart';
import 'speaker.dart';

part 'talk.g.dart';

@JsonSerializable()
class Talk {
  String title;
  DateTime start;
  DateTime end;
  Location location;
  String? link;
  List<Speaker>? speakers;

  Talk({
    required this.title,
    required this.start,
    required this.end,
    required this.location,
    this.link,
    this.speakers,
  });

  factory Talk.fromJson(Map<String, dynamic> json) => _$TalkFromJson(json);
  Map<String, dynamic> toJson() => _$TalkToJson(this);
}
