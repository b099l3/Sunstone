import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ordered_set/comparing.dart';
import 'package:ordered_set/ordered_set.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../application/schedule_provider.dart';
import '../domain/talk.dart';
import '../infrastructure/conf_data.dart';
import '../shared/date_time_ext.dart';
import 'routes/router.gr.dart';
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

    DateTime dayTracker = DateTime(1970, 1, 1, 9, 00);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        splashColor: Colors.purple,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        // foregroundColor: Colors.transparent,
        enableFeedback: false,
        disabledElevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        highlightElevation: 0,
        elevation: 0,
        child: const Text(
          '💙',
          style: TextStyle(fontSize: 36),
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
                onPressed: () =>
                    launchUrl(Uri.parse('https://twitter.com/b099l3')),
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
                onPressed: () =>
                    launchUrl(Uri.parse('https://github.com/b099l3')),
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
      body: ListView.builder(
        itemCount: orderedTalks.length,
        itemBuilder: (context, index) {
          final talk = orderedTalks.elementAt(index);
          if (!dayTracker.isSameDate(talk.start)) {
            // new day
            dayTracker = talk.start;
            final day =
                ConfData.days.indexWhere((day) => talk.start.isSameDate(day)) +
                    1;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Day $day',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  talk.title,
                  textAlign: TextAlign.start,
                ),
              ],
            );
          }
          return Text(talk.title);
        },
      ),
    );
  }
}
