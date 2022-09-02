import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../application/schedule_provider.dart';
import '../domain/talk.dart';
import '../domain/time_interval.dart';
import '../infrastructure/conf_data.dart';
import '../infrastructure/talks_data.dart';
import '../infrastructure/time_intervals_data.dart';
import '../shared/date_time_ext.dart';
import '../shared/talk_ext.dart';
import 'routes/router.gr.dart';
import 'widgets/sunstone_app_bar.dart';
import 'widgets/talk_card.dart';

class SelectionPage extends ConsumerWidget {
  final int timeIntervalIndex;
  final bool fromSchedule;
  const SelectionPage({
    Key? key,
    this.fromSchedule = false,
    @PathParam('id') this.timeIntervalIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeIntervals = TimeIntervalsData.data.entries.toList()
      ..sort(((a, b) => a.key.compareTo(b.key)));
    final timeInterval = timeIntervals.elementAt(timeIntervalIndex).value;
    final talks = TalksData.getTalksForTimeInterval(timeInterval).toList();
    final day =
        ConfData.days.indexWhere((day) => timeInterval.start.isSameDate(day));
    return Scaffold(
      appBar: SunstoneAppBar(
        text: 'Day ${day + 1} - ${timeInterval.start.toFormatedString()} ',
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 32),
        itemCount: talks.length,
        itemBuilder: (context, index) {
          final talk = talks[index];
          return GestureDetector(
            onTap: () async {
              if (talk.isNow || talk.hasPassed) {
                return;
              }
              final talksToAdd = talks
                  .where((t) => t.location == talk.location)
                  .fold<MapEntry<DateTime, List<Talk>>>(
                MapEntry(talk.start, []),
                (mapEntry, currenTalk) {
                  mapEntry.value.add(currenTalk);
                  return mapEntry;
                },
              );
              ref
                  .read(savedScheduleProvider)
                  .value!
                  .data
                  .addAll(Map.fromEntries([talksToAdd]));

              await saveSelection(ref);
              forward(context, talksToAdd.value, timeInterval);
            },
            child: TalkCard(talk: talk),
          );
        },
      ),
    );
  }

  void forward(
      BuildContext context, List<Talk> talks, TimeInterval timeInterval) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    final nextTimeIntervalIndex = timeIntervalIndex + 1;
    if (nextTimeIntervalIndex < TimeIntervalsData.data.length || fromSchedule) {
      final talksString = talks.length > 1
          ? talks
              .map((t) => t.title)
              .fold('', (previousValue, element) => '$previousValue-$element\n')
          : '• ${talks.first.title}\n';
      var snackBar = SnackBar(
        content: Text(
          'Added\n${talksString}at ${timeInterval.start.toFormatedString()}',
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      if (fromSchedule) {
        context.router.pop();
      } else {
        context.router.push(SelectionRoute(
          timeIntervalIndex: nextTimeIntervalIndex,
        ));
      }
    } else {
      var snackBar = const SnackBar(
        content: Text(
          'Schedule Complete!',
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      context.router.replaceAll([const ScheduleRoute()]);
    }
  }

  Future<void> saveSelection(WidgetRef ref) async {
    final prefs = await SharedPreferences.getInstance();
    final scheduleToSave = ref.read(savedScheduleProvider).value!.toJson();
    await prefs.setString(
      scheduleKey,
      jsonEncode(scheduleToSave),
    );
  }
}
