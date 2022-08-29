import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/presentation/app_widget.dart';

void main() async {
  // await tz.initializeTimeZone(Assets.timezone.data.latest10y);
  // var byteData = await rootBundle.load('packages/timezone/data/latest_10y.tzf');
  // initializeDatabase(byteData.buffer.asUint8List());
  runApp(ProviderScope(child: App()));
}
