import 'package:sunstone/domain/location.dart';
import 'package:sunstone/domain/speaker.dart';

class Talk {
  String title;
  DateTime start;
  DateTime end;
  Location location;
  String? link;
  List<Speaker>? speakers;

  Talk({
    required this.title,
    required this.start,
    required this.end,
    required this.location,
    this.link,
    this.speakers,
  });
}
