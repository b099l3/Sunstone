import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'core/presentation/app_widget.dart';

void main() async {
  tz.initializeTimeZones();
  runApp(ProviderScope(child: App()));
}
