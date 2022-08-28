import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ordered_set/comparing.dart';
import 'package:ordered_set/ordered_set.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../application/schedule_provider.dart';
import '../domain/schedule.dart';
import '../domain/talk.dart';
import '../infrastructure/conf_data.dart';
import '../shared/date_time_ext.dart';
import 'routes/router.gr.dart';
import 'widgets/schedule_card.dart';
import 'widgets/sunstone.dart';
import 'widgets/sunstone_app_bar.dart';

class SchedulePage extends ConsumerWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(scheduleProvider);

    final orderedTalks =
        OrderedSet<Talk>(Comparing.join([(p) => p.start, (p) => p.title]));
    orderedTalks.addAll(value.data.entries.expand((e) => e.value));

    final day1Talks = orderedTalks
        .where((t) => t.start.isSameDate(ConfData.days[0]))
        .toList();
    final day2Talks = orderedTalks
        .where((t) => t.start.isSameDate(ConfData.days[1]))
        .toList();

    AsyncValue<Schedule> config = ref.watch(savedScheduleProvider);

    return config.when(
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text('Error: $err'),
      data: (savedSchedule) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.white,
              splashColor: Colors.purple,
              child: const Icon(
                Icons.waving_hand,
                color: Colors.black,
              ),
              onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text(
                    'Built by Iain Smith',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  content: Text(
                    'Come say hey if you are at Flutter Vikings or follow me on:',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey.shade900,
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => launchUrl(
                        Uri.parse('https://twitter.com/b099l3'),
                        mode: LaunchMode.externalApplication,
                      ),
                      child: const Text(
                        'Twitter',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => launchUrl(
                        Uri.parse('https://github.com/b099l3'),
                        mode: LaunchMode.externalApplication,
                      ),
                      child: const Text(
                        'Github',
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
            ),
            appBar: SunstoneAppBar(
              text: 'Your Schedule',
              bottom: const TabBar(
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
                labelStyle: TextStyle(
                  fontFamily: 'Norse',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                unselectedLabelStyle: TextStyle(
                  fontFamily: 'Norse',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
                tabs: [
                  Tab(text: 'Day 1'),
                  Tab(text: 'Day 2'),
                ],
              ),
              actions: [
                GestureDetector(
                  onTap: () => showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text(
                        'Use the Sunstone again?',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      content: Text(
                        'This will clear your schedule and start again?',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey.shade900,
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => context.router.pop(),
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade900,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            //TODO this should really not be here, but I dont have alot of time
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.clear();
                            ref.read(scheduleProvider.notifier).state.clear();
                            context.router.replaceAll([const HomeRoute()]);
                          },
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
                  child: const Sunstone(),
                )
              ],
            ),
            body: TabBarView(
              children: [
                ListView.builder(
                  itemCount: day1Talks.length,
                  itemBuilder: (context, index) {
                    final talk = day1Talks.elementAt(index);
                    return ScheduleCard(talk);
                  },
                ),
                ListView.builder(
                  itemCount: day2Talks.length,
                  itemBuilder: (context, index) {
                    final talk = day2Talks.elementAt(index);
                    return ScheduleCard(talk);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
