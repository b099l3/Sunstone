import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/schedule_provider.dart';
import '../domain/schedule.dart';
import '../infrastructure/conf_data.dart';
import '../shared/date_time_ext.dart';
import 'theme/text_styles.dart';
import 'widgets/dialogs/dialogs.dart';
import 'widgets/schedule_card.dart';
import 'widgets/sunstone.dart';
import 'widgets/sunstone_app_bar.dart';

class SchedulePage extends ConsumerWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Schedule> config = ref.watch(savedScheduleProvider);
    ref.listen(updateEveryMinProvider, (_, next) {
      debugPrint('refreshed ${DateTime.now().toFormatedString()}');
      ref.invalidate(savedScheduleProvider);
    });
    return config.when(
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text('Error: $err'),
      data: (savedSchedule) {
        final orderedTalks =
            savedSchedule.data.entries.expand((entry) => entry.value).toList();
        orderedTalks.sort((a, b) => a.start.compareTo(b.start));

        final talksOnDays = ConfData.days.map((conferenceDay) => orderedTalks
            .where((t) => t.start.isSameDate(conferenceDay))
            .toList());

        return DefaultTabController(
          length: talksOnDays.length,
          child: Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.white,
              splashColor: Colors.purple,
              child: const Icon(
                Icons.waving_hand,
                color: Colors.black,
              ),
              onPressed: () => Dialogs.showHelloDialog(context),
            ),
            appBar: SunstoneAppBar(
              text: 'Your Schedule',
              bottom: TabBar(
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.grey,
                  labelStyle: TextStyles.body,
                  unselectedLabelStyle: TextStyles.bodyGrey,
                  tabs: ConfData.days
                      .mapIndexed((index, conferenceDay) =>
                          Tab(text: 'Day ${index + 1}'))
                      .toList()),
              actions: [
                GestureDetector(
                  onTap: () => Dialogs.showClearDialog(context),
                  child: const Sunstone(),
                )
              ],
            ),
            body: TabBarView(
              children: talksOnDays
                  .map(
                    (talks) => ListView.builder(
                      itemCount: talks.length,
                      itemBuilder: (context, index) {
                        final talk = talks.elementAt(index);
                        return ScheduleCard(talk);
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
