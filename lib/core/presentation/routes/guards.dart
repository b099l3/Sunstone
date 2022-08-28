import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../application/schedule_provider.dart';
import '../../domain/schedule.dart';
import '../../infrastructure/talks_data.dart';
import 'router.gr.dart';

class ScheduleSetGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    // Again this should be like this, duplicated code but Im on holiday
    final prefs = await SharedPreferences.getInstance();
    final jsonSchedule = prefs.getString(scheduleKey);

    if (jsonSchedule != null) {
      final content = json.decode(jsonSchedule) as Map<String, Object?>;
      final schedule = Schedule.fromJson(content);
      if (schedule.data.length > TalksData.getMandatoryTalks().length) {
        router.replace(const ScheduleRoute());
        return;
      }
    }
    resolver.next(true);
  }
}
