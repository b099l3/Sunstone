import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/schedule_provider.dart';
import '../domain/schedule.dart';
import '../infrastructure/talks_data.dart';
import 'routes/router.gr.dart';
import 'widgets/animations/hover.dart';
import 'widgets/animations/shake.dart';
import 'widgets/button.dart';
import 'widgets/sunstone.dart';
import 'widgets/sunstone_app_bar.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(scheduleProvider);
    AsyncValue<Schedule> config = ref.watch(savedScheduleProvider);

    return config.when(
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text('Error: $err'),
      data: (savedSchedule) {
        ref.read(scheduleProvider.notifier).state.addFrom(savedSchedule.data);
        return Scaffold(
          // backgroundColor: const Color(0xFF010022),
          appBar: SunstoneAppBar(
            text: 'Sunstone',
            actions: [
              IconButton(
                highlightColor: Colors.transparent,
                focusColor: Colors.transparent,
                splashColor: Colors.transparent,
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text(
                      'Sunstone?',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    content: Text(
                      'Vikings used Suntones to navigate the sea.\nYou can navigate Flutter Vikings using a Sunstone too!\nTap the Sunstone to start',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey.shade900,
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => context.router.pop(),
                        child: const Text(
                          'OK',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                icon: const Icon(
                  Icons.info,
                ),
              ),
            ],
          ),
          body: ListView(
            children: [
              Shake(
                child: Hover(
                  child: GestureDetector(
                    onTap: () => context.router.push(SelectionRoute()),
                    child: const Sunstone(),
                  ),
                ),
              ),
              if (value.data.length > TalksData.getMandatoryTalks().length)
                Button(
                  onPressed: () => context.router.push(const ScheduleRoute()),
                  text: 'See Schedule',
                ),
            ],
          ),
        );
      },
    );
  }
}
