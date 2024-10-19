import 'package:go_router/go_router.dart';
import 'package:ostello/model/goalmodel.dart';
import 'package:ostello/ui/pages/goal/class/page.dart';
import 'package:ostello/ui/pages/goal/customize/page.dart';
import 'package:ostello/ui/pages/goal/page.dart';

List<RouteBase> goalroutes = [
  GoRoute(
    path: GoalPage.route,
    name: GoalPage.routeName,
    builder: (context, state) => GoalPage(),
  ),
  GoRoute(
    path: SelectClassPage.route,
    name: SelectClassPage.routeName,
    builder: (context, state) => SelectClassPage(
      data: state.extra as Goalmodel,
    ),
  ),
  GoRoute(
    path: CustomizingPage.route,
    name: CustomizingPage.routeName,
    builder: (context, state) => CustomizingPage(),
  ),
];
