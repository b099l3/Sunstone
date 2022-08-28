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
        // color: talk.location.color(),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
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
                  IconButton(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.topRight,
                    visualDensity: VisualDensity.compact,
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
                  ),
                ],
              ),
              IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.schedule,
                            color: Colors.blueGrey.shade900,
                          ),
                        ),
                        Text(
                          '${talk.start.toFormatedString()} - ${talk.end.toFormatedString()}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey.shade900,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Column(
                        children: talk.speakers!
                            .map(
                              (speaker) => Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 4.0,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: CircleAvatar(
                                        radius: 18,
                                        backgroundColor: Colors.grey,
                                        backgroundImage:
                                            NetworkImage(speaker.imageUrl),
                                      ),
                                    ),
                                    Text(
                                      speaker.name,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade800,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
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
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
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
