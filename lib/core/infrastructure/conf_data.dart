import 'package:timezone/browser.dart' as tz;
class ConfData {
  static List<DateTime> days = [
    DateTime(2022, 8, 31, 9, 00),
    DateTime(2022, 9, 1, 9, 00),
  ];

  static DateTime get nowInConference {
    var oslo = tz.getLocation('Europe/Oslo');
    var nowOslo = tz.TZDateTime.now(oslo);
    return nowOslo;
  }
}
