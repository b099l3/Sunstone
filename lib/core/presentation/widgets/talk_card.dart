import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../domain/talk.dart';
import '../../shared/date_time_ext.dart';
import '../../shared/location_ext.dart';
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
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
              child: Text(
                talk.title,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Chip(
                      labelPadding: const EdgeInsets.all(0),
                      padding: const EdgeInsets.all(0.0),
                      backgroundColor: Colors.white,
                      avatar: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.schedule,
                          color: Colors.blueGrey.shade900,
                        ),
                      ),
                      label: Text(
                        '${talk.start.toFormatedString()} - ${talk.end.toFormatedString()}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey.shade900,
                        ),
                      ),
                    ),
                    Chip(
                      labelPadding: const EdgeInsets.fromLTRB(0, 4, 6, 0),
                      padding: const EdgeInsets.all(4.0),
                      backgroundColor: talk.location.color(),
                      avatar: CircleAvatar(
                        backgroundColor: talk.location.color(),
                        child: const Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                      ),
                      label: Text(
                        talk.location.name.capitalise(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Row(
                      children: talk.speakers!
                          .map(
                            (speaker) => Chip(
                              labelPadding:
                                  const EdgeInsets.fromLTRB(0, 4, 6, 0),
                              padding: const EdgeInsets.all(4.0),
                              backgroundColor: Colors.grey,
                              avatar: const CircleAvatar(
                                backgroundColor: Colors.grey,
                                child: Icon(
                                  Icons.people,
                                  color: Colors.white,
                                ),
                              ),
                              label: Text(
                                speaker.name,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                highlightColor: Colors.transparent,
                focusColor: Colors.transparent,
                splashColor: Colors.transparent,
                icon: const Icon(
                  Icons.info_outline_rounded,
                ),
                onPressed: () {
                  if (talk.link != null) {
                    _launchUrl(Uri.parse(talk.link!));
                  }
                },
                // child: const Text('more info'),
              ),
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
