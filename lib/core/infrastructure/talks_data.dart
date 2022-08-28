import '../domain/location.dart';
import '../domain/speaker.dart';
import '../domain/talk.dart';
import '../domain/time_interval.dart';
import '../shared/date_time_ext.dart';

class TalksData {
  static Iterable<Talk> getTalksForTimeInterval(TimeInterval timeInteval) {
    return data.where((talk) =>
        (talk.start.isAfter(timeInteval.start) ||
            talk.start.isAtSameMomentAs(timeInteval.start)) &&
        (talk.end.isBefore(timeInteval.end) ||
            talk.end.isAtSameMomentAs(timeInteval.end)) &&
        talk.start.isSameDate(timeInteval.start));
  }

  static Map<DateTime, List<Talk>> getMandatoryTalks() {
    final mapEntryTalks = data
        .where((talk) => (talk.speakers == null))
        .map((t) => MapEntry(t.start, [t]));
    final mTalks = Map.fromEntries(mapEntryTalks);
    return mTalks;
  }

  static List<Talk> get data => [
        Talk(
          title: 'REGISTRATION',
          start: DateTime(2022, 8, 31, 8, 00),
          end: DateTime(2022, 8, 31, 8, 50),
          location: Location.other,
        ),
        Talk(
          title: 'REGISTRATION',
          start: DateTime(2022, 9, 1, 8, 00),
          end: DateTime(2022, 9, 1, 9, 00),
          location: Location.other,
        ),
        Talk(
          title: 'OPENING',
          start: DateTime(2022, 8, 31, 8, 50),
          end: DateTime(2022, 8, 31, 9, 00),
          location: Location.other,
        ),
        //-----------------//
        // START OF TALKS //
        //----------------//
        Talk(
          title: 'Deep Dive Into Flutter Theming',
          start: DateTime(2022, 8, 31, 9, 00),
          end: DateTime(2022, 8, 31, 10, 00),
          location: Location.valhalla,
          link: 'https://fluttervikings.com/deep-dive-into-flutter-theming',
          speakers: [Speaker.mikeRydstrom()],
        ),
        Talk(
          title:
              'Flutter, FFI And Fun: Windows Development With Dart And Win32',
          start: DateTime(2022, 9, 1, 9, 00),
          end: DateTime(2022, 9, 1, 10, 00),
          location: Location.valhalla,
          link:
              'https://fluttervikings.com/flutter-ffi-and-fun-windows-development-with-dart-and-win32',
          speakers: [Speaker.timSneath()],
        ),
        Talk(
          title: 'Take You Flutter Animations To The Next Level',
          start: DateTime(2022, 8, 31, 9, 00),
          end: DateTime(2022, 8, 31, 10, 00),
          location: Location.thor,
          link:
              'https://fluttervikings.com/take-you-flutter-animations-to-the-next-level',
          speakers: [Speaker.roaaKhaddam()],
        ),

        Talk(
          title:
              'Taking The Bus. Create Reactive Flutter Apps, Using An Event Bus',
          start: DateTime(2022, 9, 1, 9, 00),
          end: DateTime(2022, 9, 1, 10, 00),
          location: Location.thor,
          link:
              'https://fluttervikings.com/taking-the-bus-create-reactive-flutter-apps-using-an-event-bus',
          speakers: [Speaker.efthymiosSarmpanis()],
        ),
        Talk(
          title: 'Let\'s Test The Full Widget Tree!',
          start: DateTime(2022, 8, 31, 9, 00),
          end: DateTime(2022, 8, 31, 10, 00),
          location: Location.odin,
          link: 'https://fluttervikings.com/lets-test-the-full-widget-tree',
          speakers: [Speaker.alicjaOgonowska()],
        ),

        Talk(
          title: 'The Ultimate Cookbook Of Flutter Testing',
          start: DateTime(2022, 9, 1, 9, 00),
          end: DateTime(2022, 9, 1, 10, 00),
          location: Location.odin,
          link:
              'https://fluttervikings.com/the-ultimate-cookbook-of-flutter-testing',
          speakers: [Speaker.teresaWu()],
        ),
        Talk(
          title: 'Fun With Code Generation',
          start: DateTime(2022, 8, 31, 10, 00),
          end: DateTime(2022, 8, 31, 11, 00),
          location: Location.valhalla,
          link: 'https://fluttervikings.com/fun-with-code-generation',
          speakers: [Speaker.annaLeushchenko()],
        ),

        Talk(
          title: 'Custom User Interactions: Building A Desktop Drawing App',
          start: DateTime(2022, 9, 1, 10, 00),
          end: DateTime(2022, 9, 1, 11, 00),
          location: Location.valhalla,
          link:
              'https://fluttervikings.com/custom-user-interactions-building-a-desktop-drawing-app',
          speakers: [Speaker.justinMcCandless()],
        ),
        Talk(
          title: 'Flutter Architecture Components',
          start: DateTime(2022, 8, 31, 10, 00),
          end: DateTime(2022, 8, 31, 11, 00),
          location: Location.thor,
          link: 'https://fluttervikings.com/flutter-architecture-components',
          speakers: [Speaker.alessioSalvadorini()],
        ),
        Talk(
          title: 'Parallel Beauty - With Isolates Into The Mandelbrot Set',
          start: DateTime(2022, 9, 1, 10, 00),
          end: DateTime(2022, 9, 1, 11, 00),
          location: Location.thor,
          link:
              'https://fluttervikings.com/parallel-beauty-with-isolates-into-the-mandelbrot-set',
          speakers: [Speaker.thomasBurkhart()],
        ),

        Talk(
          title: 'Flutter Web In Action',
          start: DateTime(2022, 8, 31, 10, 00),
          end: DateTime(2022, 8, 31, 11, 00),
          location: Location.odin,
          link: 'https://fluttervikings.com/flutter-web-in-action',
          speakers: [Speaker.joachimBohmer()],
        ),

        Talk(
          title: 'Power Of Federated Plugins In Flutter\'s Ecosystem',
          start: DateTime(2022, 9, 1, 10, 00),
          end: DateTime(2022, 9, 1, 11, 00),
          location: Location.odin,
          link:
              'https://fluttervikings.com/power-of-federated-plugins-in-flutters-ecosystem',
          speakers: [Speaker.maisAlheraki(), Speaker.guillaumeBernos()],
        ),
        //----------------//
        /// END OF TALKS //
        //---------------//
        Talk(
          title: 'LUNCH',
          start: DateTime(2022, 8, 31, 11, 00),
          end: DateTime(2022, 8, 31, 12, 30),
          location: Location.other,
        ),
        Talk(
          title: 'LUNCH',
          start: DateTime(2022, 9, 1, 11, 00),
          end: DateTime(2022, 9, 1, 13, 00),
          location: Location.other,
        ),
        Talk(
          title: 'GROUP PHOTO',
          start: DateTime(2022, 8, 31, 12, 30),
          end: DateTime(2022, 8, 31, 13, 00),
          location: Location.other,
        ),

        //-----------------//
        // START OF TALKS //
        //----------------//
        Talk(
          title: 'Lifecycle Of A Widget',
          start: DateTime(2022, 8, 31, 13, 00),
          end: DateTime(2022, 8, 31, 14, 00),
          location: Location.valhalla,
          link: 'https://fluttervikings.com/lifecycle-of-a-widget',
          speakers: [Speaker.craigLabenz()],
        ),

        Talk(
          title: 'Building Flutter Apps In Lego Style',
          start: DateTime(2022, 9, 1, 13, 00),
          end: DateTime(2022, 9, 1, 14, 00),
          location: Location.valhalla,
          link:
              'https://fluttervikings.com/building-flutter-apps-in-lego-style',
          speakers: [Speaker.annaLeushchenko(), Speaker.oleksandrLeushchenko()],
        ),
        Talk(
          title: 'End To End IoT With Dart And Flutter',
          start: DateTime(2022, 8, 31, 13, 00),
          end: DateTime(2022, 8, 31, 14, 00),
          location: Location.thor,
          link:
              'https://fluttervikings.com/end-to-end-iot-with-dart-and-flutter',
          speakers: [Speaker.chrisSwan()],
        ),

        Talk(
          title: 'Meet Mason: Intro To Templating And Custom Code Generation',
          start: DateTime(2022, 9, 1, 13, 00),
          end: DateTime(2022, 9, 1, 14, 00),
          location: Location.thor,
          link:
              'https://fluttervikings.com/meet-mason-intro-to-templating-and-custom-code-generation',
          speakers: [Speaker.felixAngelov()],
        ),
        Talk(
          title: 'M1 Mac Machines In CI/CD For Flutter Developers',
          start: DateTime(2022, 8, 31, 13, 00),
          end: DateTime(2022, 8, 31, 13, 10),
          location: Location.odin,
          link:
              'https://fluttervikings.com/m1-mac-machines-in-cicd-for-flutter-developers',
          speakers: [Speaker.nilsReichardt()],
        ),

        Talk(
          title: 'Apple Watch + Flutter = No Problem!',
          start: DateTime(2022, 9, 1, 13, 00),
          end: DateTime(2022, 9, 1, 13, 10),
          location: Location.odin,
          link: 'https://fluttervikings.com/apple-watch-flutter-no-problem',
          speakers: [Speaker.nilsReichardt()],
        ),

        Talk(
          title: 'Flipping Developer Relations In The World Of Flutter',
          start: DateTime(2022, 9, 1, 13, 10),
          end: DateTime(2022, 9, 1, 13, 20),
          location: Location.odin,
          link:
              'https://fluttervikings.com/flipping-developer-relations-in-the-world-of-flutter',
          speakers: [Speaker.anthonyPrakash()],
        ),

        Talk(
          title: 'Importance Of Community And Leadership',
          start: DateTime(2022, 8, 31, 13, 10),
          end: DateTime(2022, 8, 31, 13, 20),
          location: Location.odin,
          link:
              'https://fluttervikings.com/importance-of-community-and-leadership',
          speakers: [Speaker.abhishekDoshi(), Speaker.akanshaJain()],
        ),

        Talk(
          title:
              'Flutter At Scale - Experience From 25+ Flutter Devs Working Together On A Mobile Banking App',
          start: DateTime(2022, 8, 31, 13, 20),
          end: DateTime(2022, 8, 31, 13, 50),
          location: Location.odin,
          link:
              'https://fluttervikings.com/flutter-at-scale-experience-from-25-flutter-devs-working-together-on-a-mobile-banking-app',
          speakers: [Speaker.mateuszWojtczak(), Speaker.albertWolszon()],
        ),

        Talk(
          title: 'A/B Tests: Understanding User Behaviour',
          start: DateTime(2022, 9, 1, 13, 20),
          end: DateTime(2022, 9, 1, 13, 30),
          location: Location.odin,
          link:
              'https://fluttervikings.com/ab-tests-understanding-user-behaviour',
          speakers: [Speaker.petraLangenbacher()],
        ),

        Talk(
          title: 'How To Make Premium Golden Tests',
          start: DateTime(2022, 9, 1, 13, 30),
          end: DateTime(2022, 9, 1, 13, 40),
          location: Location.odin,
          link: 'https://fluttervikings.com/how-to-make-premium-golden-tests',
          speakers: [Speaker.matthieuPernelle()],
        ),

        Talk(
          title: 'Architecting Success - Building A Great Open-Source SDK',
          start: DateTime(2022, 8, 31, 14, 00),
          end: DateTime(2022, 8, 31, 15, 00),
          location: Location.odin,
          link:
              'https://fluttervikings.com/architecting-success-building-a-great-open-source-sdk',
          speakers: [Speaker.devenJoshi(), Speaker.gordonHayes()],
        ),
        Talk(
          title: 'Draw Undrawable With Your Custom RenderBox!',
          start: DateTime(2022, 9, 1, 14, 00),
          end: DateTime(2022, 9, 1, 15, 00),
          location: Location.odin,
          link:
              'https://fluttervikings.com/draw-undrawable-with-your-custom-renderbox',
          speakers: [Speaker.wiktoriaSobczyk(), Speaker.kamilKlyta()],
        ),
        Talk(
          title: 'Snapchat Filters With Flutter\'s CustomPainter And MLKit',
          start: DateTime(2022, 8, 31, 14, 00),
          end: DateTime(2022, 8, 31, 15, 00),
          location: Location.valhalla,
          link:
              'https://fluttervikings.com/snapchat-filters-with-flutters-custompainter-and-mlkit',
          speakers: [Speaker.poojaBhaumik(), Speaker.akankshaSingh()],
        ),

        Talk(
          title: 'Another World In Flutter',
          start: DateTime(2022, 9, 1, 14, 00),
          end: DateTime(2022, 9, 1, 15, 00),
          location: Location.valhalla,
          link: 'https://fluttervikings.com/another-world-in-flutter',
          speakers: [Speaker.simonLightfoot()],
        ),
        Talk(
          title: 'Creating Responsive UI For Authentication Flows',
          start: DateTime(2022, 8, 31, 14, 00),
          end: DateTime(2022, 8, 31, 15, 00),
          location: Location.thor,
          link:
              'https://fluttervikings.com/creating-responsive-ui-for-authentication-flows',
          speakers: [Speaker.salihGuler()],
        ),
        Talk(
          title:
              'Trusting Your Clients: Live-Coding A Cross-Platform Multiplayer Bingo App',
          start: DateTime(2022, 9, 1, 14, 00),
          end: DateTime(2022, 9, 1, 15, 00),
          location: Location.thor,
          link:
              'https://fluttervikings.com/trusting-your-clients-live-coding-a-cross-platform-multiplayer-bingo-app',
          speakers: [Speaker.ericWindmill(), Speaker.frankVanPuffelen()],
        ),
        //----------------//
        /// END OF TALKS //
        //---------------//
        Talk(
          title: 'COFFEE BREAK',
          start: DateTime(2022, 8, 31, 15, 00),
          end: DateTime(2022, 8, 31, 15, 30),
          location: Location.other,
        ),
        Talk(
          title: 'COFFEE BREAK',
          start: DateTime(2022, 9, 1, 15, 00),
          end: DateTime(2022, 9, 1, 15, 30),
          location: Location.other,
        ),

        //-----------------//
        // START OF TALKS //
        //----------------//
        Talk(
          title: 'Structure Your GraphQL Apps!',
          start: DateTime(2022, 8, 31, 15, 30),
          end: DateTime(2022, 8, 31, 16, 30),
          location: Location.valhalla,
          link: 'https://fluttervikings.com/structure-your-graphql-apps',
          speakers: [Speaker.christianBuddeChristensen()],
        ),

        Talk(
          title: 'Quick Start To Game Development In Flutter',
          start: DateTime(2022, 9, 1, 15, 30),
          end: DateTime(2022, 9, 1, 16, 30),
          location: Location.valhalla,
          link:
              'https://fluttervikings.com/quick-start-to-game-development-in-flutter',
          speakers: [Speaker.filipHracek()],
        ),

        Talk(
          title: 'Understanding Flutter\'s Handling Of Gestures',
          start: DateTime(2022, 8, 31, 15, 30),
          end: DateTime(2022, 8, 31, 16, 30),
          location: Location.thor,
          link:
              'https://fluttervikings.com/understanding-flutters-handling-of-gestures',
          speakers: [Speaker.guillaumeDialloMulliez()],
        ),

        Talk(
          title:
              'From Single Player To Multiplayer - Building Realtime Collaborative Experiences With Flutter',
          start: DateTime(2022, 9, 1, 15, 30),
          end: DateTime(2022, 9, 1, 16, 30),
          location: Location.thor,
          link:
              'https://fluttervikings.com/from-single-player-to-multiplayer-building-realtime-collaborative-experiences-with-flutter',
          speakers: [Speaker.iiroKrankka()],
        ),

        Talk(
          title: 'Advanced Scroll Techniques For Desktop',
          start: DateTime(2022, 8, 31, 15, 30),
          end: DateTime(2022, 8, 31, 16, 30),
          location: Location.odin,
          link:
              'https://fluttervikings.com/advanced-scroll-techniques-for-desktop',
          speakers: [Speaker.renanAraujo()],
        ),

        Talk(
          title:
              'Secure Your Flutter Web App Using Multi Factor Authentication.',
          start: DateTime(2022, 9, 1, 15, 30),
          end: DateTime(2022, 9, 1, 16, 30),
          location: Location.odin,
          link:
              'https://fluttervikings.com/secure-your-flutter-web-app-using-multi-factor-authentication',
          speakers: [Speaker.renukaKelkar()],
        ),
        Talk(
          title: 'Riverpod 2.0',
          start: DateTime(2022, 8, 31, 16, 30),
          end: DateTime(2022, 8, 31, 17, 30),
          location: Location.valhalla,
          link: 'https://fluttervikings.com/riverpod-20',
          speakers: [Speaker.remiRousselet()],
        ),
        Talk(
          title: 'Native Platform Views For Mobile And Beyond',
          start: DateTime(2022, 8, 31, 16, 30),
          end: DateTime(2022, 8, 31, 17, 30),
          location: Location.thor,
          link:
              'https://fluttervikings.com/native-platform-views-for-mobile-and-beyond',
          speakers: [Speaker.dominikRoszkowski()],
        ),
        Talk(
          title: 'Google Fonts Flutter',
          start: DateTime(2022, 8, 31, 16, 30),
          end: DateTime(2022, 8, 31, 16, 55),
          location: Location.odin,
          link: 'https://fluttervikings.com/google-fonts-flutter',
          speakers: [Speaker.anthonyRobledo()],
        ),
        Talk(
          title: 'Enhancing My App For Foldables',
          start: DateTime(2022, 8, 31, 16, 55),
          end: DateTime(2022, 8, 31, 17, 25),
          location: Location.odin,
          link: 'https://fluttervikings.com/enhancing-my-app-for-foldables',
          speakers: [Speaker.andreiTudorDiaconu()],
        ),
        //----------------//
        /// END OF TALKS //
        //---------------//
        Talk(
          title: 'FINAL WORDS',
          start: DateTime(2022, 8, 31, 17, 30),
          end: DateTime(2022, 8, 31, 17, 45),
          location: Location.other,
        ),
        Talk(
          title: 'PARTY',
          start: DateTime(2022, 8, 31, 19, 00),
          end: DateTime(2022, 8, 31, 23, 50),
          location: Location.other,
        ),

        Talk(
          title: 'FLUTTER TEAM Q/A',
          start: DateTime(2022, 9, 1, 16, 30),
          end: DateTime(2022, 9, 1, 17, 30),
          location: Location.other,
        ),
        Talk(
          title: 'FINAL WORDS - WINNERS',
          start: DateTime(2022, 9, 1, 17, 30),
          end: DateTime(2022, 9, 1, 17, 45),
          location: Location.other,
        ),
      ];
}
