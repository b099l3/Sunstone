import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timezone/browser.dart' as tz;

import 'core/presentation/app_widget.dart';
import 'gen/assets.gen.dart';

void main() async {
  await tz.initializeTimeZone(Assets.timezone.data.latest10y);
  runApp(ProviderScope(child: App()));
}
