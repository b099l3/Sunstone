import 'package:auto_route/annotations.dart';

import '../home_page.dart';
import '../schedule_page.dart';
import '../selection_page.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: HomePage, initial: true),
    MaterialRoute(page: SchedulePage, path: '/schedule'),
    MaterialRoute(page: SelectionPage, path: '/selection/:id'),
  ],
  replaceInRouteName: 'Page,Route',
)
class $AppRouter {}