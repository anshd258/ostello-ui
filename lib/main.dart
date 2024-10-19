import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ostello/core/logging/talker.dart';
import 'package:ostello/core/theme/theme.dart';
import 'package:ostello/routes/authroutes.dart';
import 'package:ostello/routes/goalroutes.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main(List<String> args) {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ostelloTheme,
      routerConfig: _routes,
    );
  }
}

final GoRouter _routes = GoRouter(
  observers: [TalkerRouteObserver(talker)],
  initialLocation: "/",
  routes: [...authroutes, ...goalroutes],
);
