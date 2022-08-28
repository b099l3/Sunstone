// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../home_page.dart' as _i1;
import '../schedule_page.dart' as _i2;
import '../selection_page.dart' as _i3;
import 'guards.dart' as _i6;

class AppRouter extends _i4.RootStackRouter {
  AppRouter(
      {_i5.GlobalKey<_i5.NavigatorState>? navigatorKey,
      required this.scheduleGuard,
      required this.homeGuard})
      : super(navigatorKey);

  final _i6.ScheduleGuard scheduleGuard;

  final _i6.HomeGuard homeGuard;

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    ScheduleRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SchedulePage());
    },
    SelectionRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SelectionRouteArgs>(
          orElse: () => SelectionRouteArgs(
              timeIntervalIndex: pathParams.getInt('id', 0)));
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.SelectionPage(
              key: args.key, timeIntervalIndex: args.timeIntervalIndex));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(HomeRoute.name, path: '/', guards: [scheduleGuard]),
        _i4.RouteConfig(ScheduleRoute.name,
            path: '/schedule', guards: [homeGuard]),
        _i4.RouteConfig(SelectionRoute.name, path: '/selection/:id')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.SchedulePage]
class ScheduleRoute extends _i4.PageRouteInfo<void> {
  const ScheduleRoute() : super(ScheduleRoute.name, path: '/schedule');

  static const String name = 'ScheduleRoute';
}

/// generated route for
/// [_i3.SelectionPage]
class SelectionRoute extends _i4.PageRouteInfo<SelectionRouteArgs> {
  SelectionRoute({_i5.Key? key, int timeIntervalIndex = 0})
      : super(SelectionRoute.name,
            path: '/selection/:id',
            args: SelectionRouteArgs(
                key: key, timeIntervalIndex: timeIntervalIndex),
            rawPathParams: {'id': timeIntervalIndex});

  static const String name = 'SelectionRoute';
}

class SelectionRouteArgs {
  const SelectionRouteArgs({this.key, this.timeIntervalIndex = 0});

  final _i5.Key? key;

  final int timeIntervalIndex;

  @override
  String toString() {
    return 'SelectionRouteArgs{key: $key, timeIntervalIndex: $timeIntervalIndex}';
  }
}
