import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/schedule_provider.dart';
import '../domain/schedule.dart';
import 'routes/router.gr.dart';
import 'widgets/animations/hover.dart';
import 'widgets/animations/shake.dart';
import 'widgets/dialogs/dialogs.dart';
import 'widgets/sunstone.dart';
import 'widgets/sunstone_app_bar.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Schedule> config = ref.watch(savedScheduleProvider);

    return config.when(
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text('Error: $err'),
      data: (savedSchedule) {
        return Scaffold(
          appBar: SunstoneAppBar(
            text: 'Sunstone',
            actions: [
              IconButton(
                highlightColor: Colors.transparent,
                focusColor: Colors.transparent,
                splashColor: Colors.transparent,
                onPressed: () => Dialogs.showHelpDialog(context),
                icon: const Icon(
                  Icons.info,
                ),
              ),
            ],
          ),
          body: Center(
            child: Shake(
              child: Hover(
                child: GestureDetector(
                  onTap: () => context.router.push(SelectionRoute()),
                  child: const Sunstone(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
