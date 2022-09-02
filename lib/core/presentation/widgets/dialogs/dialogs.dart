import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../gen/assets.gen.dart';
import '../../routes/router.gr.dart';
import '../../theme/text_styles.dart';

class Dialogs {
  static showClearDialog(BuildContext context) => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(
            'Use the Sunstone again?',
            style: TextStyles.body,
          ),
          content: Text(
            'This will clear your schedule and start again?',
            style: TextStyles.subtitle,
          ),
          actions: [
            TextButton(
              onPressed: () => context.router.pop(),
              child: Text(
                'Cancel',
                style: TextStyles.bodyGrey,
              ),
            ),
            TextButton(
              onPressed: () async {
                //TODO this should really not be here, but I dont have alot of time
                // See new comment in providers
                final prefs = await SharedPreferences.getInstance();
                await prefs.clear();
                context.router.replaceAll([const HomeRoute()]);
              },
              child: Text(
                'OK',
                style: TextStyles.bodyPurple,
              ),
            ),
          ],
        ),
      );

  static showHelloDialog(BuildContext context) => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(
            'Built by Iain Smith',
            style: TextStyles.body,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: Assets.images.me.image().image,
                  radius: 80,
                ),
              ),
              Text(
                'Come say hey if you are at Flutter Vikings or follow me on:',
                style: TextStyles.subtitle,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => launchUrl(
                Uri.parse('https://twitter.com/b099l3'),
                mode: LaunchMode.inAppWebView,
              ),
              child: Text(
                'Twitter',
                style: TextStyles.twitter,
              ),
            ),
            TextButton(
              onPressed: () => launchUrl(
                Uri.parse('https://github.com/b099l3'),
                mode: LaunchMode.inAppWebView,
              ),
              child: Text(
                'Github',
                style: TextStyles.github,
              ),
            ),
          ],
        ),
      );

  static showHelpDialog(BuildContext context) => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(
            'Sunstone?',
            style: TextStyles.body,
          ),
          content: Text(
            'Vikings used Suntones to navigate the sea.\nYou can navigate Flutter Vikings using a Sunstone too!\n• Tap the Sunstone to start\n• Then choose the talks you want to see by tapping on them',
            style: TextStyles.subtitle,
          ),
          actions: [
            TextButton(
              onPressed: () => context.router.pop(),
              child: Text(
                'OK',
                style: TextStyles.bodyPurple,
              ),
            ),
          ],
        ),
      );
}
