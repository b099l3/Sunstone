import '../domain/talk.dart';
import '../domain/time_interval.dart';
import '../shared/date_time_ext.dart';

class TimeIntervalsData {
  static TimeInterval getTimeIntervalForTalk(Talk talk) {
    return data.values
        .where((timeInterval) =>
            (talk.start.isAfter(timeInterval.start) ||
                talk.start.isAtSameMomentAs(timeInterval.start)) &&
            (talk.end.isBefore(timeInterval.end) ||
                talk.end.isAtSameMomentAs(timeInterval.end)) &&
            talk.start.isSameDate(timeInterval.start))
        .first;
  }

  static Map<DateTime, TimeInterval> data = {
    DateTime(2022, 8, 31, 9, 00): TimeInterval(
      DateTime(2022, 8, 31, 9, 00),
      DateTime(2022, 8, 31, 10, 00),
    ),
    DateTime(2022, 8, 31, 10, 00): TimeInterval(
      DateTime(2022, 8, 31, 10, 00),
      DateTime(2022, 8, 31, 11, 00),
    ),
    DateTime(2022, 8, 31, 13, 00): TimeInterval(
      DateTime(2022, 8, 31, 13, 00),
      DateTime(2022, 8, 31, 14, 00),
    ),
    DateTime(2022, 8, 31, 14, 00): TimeInterval(
      DateTime(2022, 8, 31, 14, 00),
      DateTime(2022, 8, 31, 15, 00),
    ),
    DateTime(2022, 8, 31, 15, 30): TimeInterval(
      DateTime(2022, 8, 31, 15, 30),
      DateTime(2022, 8, 31, 16, 30),
    ),
    DateTime(2022, 8, 31, 16, 30): TimeInterval(
      DateTime(2022, 8, 31, 16, 30),
      DateTime(2022, 8, 31, 17, 30),
    ),
    DateTime(2022, 9, 1, 9, 00): TimeInterval(
      DateTime(2022, 9, 1, 9, 00),
      DateTime(2022, 9, 1, 10, 00),
    ),
    DateTime(2022, 9, 1, 10, 00): TimeInterval(
      DateTime(2022, 9, 1, 10, 00),
      DateTime(2022, 9, 1, 11, 00),
    ),
    DateTime(2022, 9, 1, 13, 00): TimeInterval(
      DateTime(2022, 9, 1, 13, 00),
      DateTime(2022, 9, 1, 14, 00),
    ),
    DateTime(2022, 9, 1, 14, 00): TimeInterval(
      DateTime(2022, 9, 1, 14, 00),
      DateTime(2022, 9, 1, 15, 00),
    ),
    DateTime(2022, 9, 1, 15, 30): TimeInterval(
      DateTime(2022, 9, 1, 15, 30),
      DateTime(2022, 9, 1, 16, 30),
    ),
  };
}
