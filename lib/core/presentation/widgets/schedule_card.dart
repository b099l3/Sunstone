import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/schedule_provider.dart';
import '../../domain/location.dart';
import '../../domain/talk.dart';
import '../../infrastructure/conf_data.dart';
import '../../infrastructure/time_intervals_data.dart';
import '../../shared/date_time_ext.dart';
import '../routes/router.gr.dart';
import '../theme/text_styles.dart';
import 'location_chip.dart';

class ScheduleCard extends ConsumerWidget {
  final Talk talk;
  const ScheduleCard(this.talk, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nowInOslo = ConfData.nowInConference;
    final isNow = nowInOslo.isAfter(talk.start) && nowInOslo.isBefore(talk.end);
    final hasPassed = nowInOslo.isAfter(talk.end);

    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 100.0,
              ),
              child: Text(
                '${talk.start.toFormatedString()} - ${talk.end.toFormatedString()}',
                textAlign: TextAlign.center,
                style: TextStyles.subtitle.copyWith(
                  fontSize: 16,
                  color: Colors.blueGrey.shade900,
                ),
              ),
            ),
          ),
          if (isNow)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text('👉', style: TextStyles.body),
            ),

          Expanded(
            child: GestureDetector(
              onTap: () async {
                if (talk.location == Location.other || hasPassed || isNow) {
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
                style: getTextStyle(hasPassed),
              ),
            ),
          ),
          if (talk.location != Location.other)
            LocationChip(
              location: talk.location,
              hasIcon: false,
            )
          // Text(
          //   talk.location.name.capitalise(),
          //   textAlign: TextAlign.end,
          //   style: TextStyles.bodyGreyS.copyWith(
          //     color: talk.location.color(),
          //   ),
          // ),
        ],
      ),
    );
  }

  TextStyle getTextStyle(bool hasPassed) {
    if (hasPassed) {
      return TextStyles.bodyGreyMLineThrough;
    }
    TextStyle textStyle = talk.location == Location.other
        ? TextStyles.bodyBlueGreyM
        : TextStyles.bodyBlackM;
    return textStyle;
  }
}
