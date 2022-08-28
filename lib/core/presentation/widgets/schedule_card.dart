import 'package:flutter/material.dart';

import '../../domain/location.dart';
import '../../domain/talk.dart';
import '../../shared/date_time_ext.dart';
import '../../shared/location_ext.dart';
import '../../shared/string_ext.dart';

class ScheduleCard extends StatelessWidget {
  final Talk talk;
  const ScheduleCard(this.talk, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
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
            child: Text(
              talk.title,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
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
