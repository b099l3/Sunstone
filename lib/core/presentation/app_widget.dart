import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'routes/router.gr.dart';

class App extends StatelessWidget {
  final _appRouter = AppRouter();

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Sunstone',
      debugShowCheckedModeBanner: !kDebugMode,
      theme: ThemeData(
        fontFamily: 'Norse',
        primarySwatch: Colors.blue,
      ),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
