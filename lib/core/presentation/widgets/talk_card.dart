import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../domain/talk.dart';
import '../../shared/date_time_ext.dart';
import '../../shared/string_ext.dart';

class TalkCard extends StatelessWidget {
  final Talk talk;
  const TalkCard({
    Key? key,
    required this.talk,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
      child: Card(
        child: Column(
          children: [
            Text(talk.title),
            Text(
                '${talk.start.toFormatedString()} - ${talk.end.toFormatedString()}'),
            Text('Location - ${talk.location.name.capitalise()}'),
            ElevatedButton(
              onPressed: () {
                if (talk.link != null) {
                  _launchUrl(Uri.parse(talk.link!));
                }
              },
              child: const Text('more info'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    try {
      if (!await launchUrl(url)) {
        debugPrint('Could not launch $url');
      }
    } catch (e) {
      // Sheeit nae internet.
    }
  }
}
