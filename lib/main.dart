import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timezone/browser.dart' as tz;

import 'core/presentation/app_widget.dart';

void main() async {
  await tz.initializeTimeZone();
  runApp(ProviderScope(child: App()));
}
