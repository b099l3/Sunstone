import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/schedule.dart';
import '../infrastructure/talks_data.dart';

const scheduleKey = 'schedule';
final savedScheduleProvider = FutureProvider<Schedule>((ref) async {
  final prefs = await SharedPreferences.getInstance();

  final jsonSchedule = prefs.getString(scheduleKey);
  if (jsonSchedule != null) {
    final content = json.decode(jsonSchedule) as Map<String, Object?>;
    return Schedule.fromJson(content);
  }

  return Schedule(data: TalksData.getMandatoryTalks());
});
