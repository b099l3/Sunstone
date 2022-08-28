import 'package:flutter/material.dart';

import '../domain/location.dart';

extension LocationExt on Location {
  Color color() {
    switch (this) {
      case Location.odin:
        return Colors.cyanAccent.shade700;
      case Location.thor:
        return Colors.tealAccent.shade700;
      case Location.valhalla:
        return Colors.amberAccent.shade700;
      default:
        return Colors.blueGrey;
    }
  }
}
