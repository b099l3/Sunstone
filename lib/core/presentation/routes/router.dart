import 'package:auto_route/annotations.dart';
import 'package:sunstone/presentation/home_page.dart';
import 'package:sunstone/presentation/schedule_page.dart';
import 'package:sunstone/presentation/selection_page.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: HomePage, initial: true),
    MaterialRoute(page: SchedulePage, path: '/schedule'),
    MaterialRoute(page: SelectionPage, path: '/selection'),
  ],
  replaceInRouteName: 'Page,Route',
)
class $AppRouter {}
