import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/schedule.dart';
import '../infrastructure/talks_data.dart';

const scheduleKey = 'schedule';

// From watching Remi's talk
// 1. I think this could be a state provider with methods
// 1.1. I can then move some of the shared preference logic into here
// 1.2 I think I can also move the everyMinProvider to be a timer
// inside this provider that invalidates

final savedScheduleProvider = FutureProvider<Schedule>((ref) async {
  final prefs = await SharedPreferences.getInstance();

  final jsonSchedule = prefs.getString(scheduleKey);
  if (jsonSchedule != null) {
    final content = json.decode(jsonSchedule) as Map<String, Object?>;
    return Schedule.fromJson(content);
  }

  return Schedule(data: TalksData.getMandatoryTalks());
});

final updateEveryMinProvider = StreamProvider.autoDispose<int>((ref) {
  return Stream<int>.periodic(const Duration(minutes: 1), (int count) => count);
});
