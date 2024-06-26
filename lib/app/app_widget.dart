import 'package:econome/logic/logic.dart';
import 'package:econome/routes.dart';
import 'package:econome/style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routefly/routefly.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: Routefly.routerConfig(
          routes: routes, // GENERATED
          routeBuilder: (context, settings, child) {
            return CupertinoPageRoute(
              settings: settings,
              builder: (context) => child,
            );
          }),
      debugShowCheckedModeBanner: false,
      title: 'sad',
      theme: Style.light,
      darkTheme: Style.dark,
      themeMode: ref.watch(themeProvider),
    );
  }
}
