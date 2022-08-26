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

import '../../../presentation/home_page.dart' as _i1;
import '../../../presentation/schedule_page.dart' as _i2;
import '../../../presentation/selection_page.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

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
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SelectionPage());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(HomeRoute.name, path: '/'),
        _i4.RouteConfig(ScheduleRoute.name, path: '/schedule'),
        _i4.RouteConfig(SelectionRoute.name, path: '/selection')
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
class SelectionRoute extends _i4.PageRouteInfo<void> {
  const SelectionRoute() : super(SelectionRoute.name, path: '/selection');

  static const String name = 'SelectionRoute';
}
