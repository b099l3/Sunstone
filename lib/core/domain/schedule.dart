import 'package:json_annotation/json_annotation.dart';

import '../infrastructure/talks_data.dart';
import 'talk.dart';

part 'schedule.g.dart';

@JsonSerializable()
class Schedule {
  Map<DateTime, List<Talk>> data;
  Schedule({
    required this.data,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleToJson(this);

  void clear() {
    data.clear();
    data.addAll(TalksData.getMandatoryTalks());
  }

  void addFrom(Map<DateTime, List<Talk>> talks) {
    data.clear();
    data.addAll(talks);
  }
}
