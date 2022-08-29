import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/schedule_provider.dart';
import '../../domain/location.dart';
import '../../domain/talk.dart';
import '../../infrastructure/time_intervals_data.dart';
import '../../shared/date_time_ext.dart';
import '../../shared/location_ext.dart';
import '../../shared/string_ext.dart';
import '../routes/router.gr.dart';

class ScheduleCard extends ConsumerWidget {
  final Talk talk;
  const ScheduleCard(this.talk, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 80.0,
              ),
              child: Text(
                '${talk.start.toFormatedString()} - ${talk.end.toFormatedString()}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blueGrey.shade900,
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () async {
                if (talk.location == Location.other) {
                  return;
                }
                final timeInterval =
                    TimeIntervalsData.getTimeIntervalForTalk(talk);
                final timeIntervalIndex = TimeIntervalsData.data.keys
                    .toList()
                    .indexOf(timeInterval.start);
                await context.router.push(SelectionRoute(
                  timeIntervalIndex: timeIntervalIndex,
                  fromSchedule: true,
                ));

                ref.invalidate(savedScheduleProvider);
              },
              child: Text(
                talk.title,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: talk.location == Location.other
                      ? Colors.blueGrey
                      : Colors.black,
                ),
              ),
            ),
          ),
          if (talk.location != Location.other)
            Text(
              talk.location.name.capitalise(),
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: talk.location.color(),
              ),
            ),
        ],
      ),
    );
  }
}
