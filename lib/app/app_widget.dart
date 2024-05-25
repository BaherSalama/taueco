import 'package:econome/routes.dart';
import 'package:econome/style/style.dart';
import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routefly.routerConfig(
          routes: routes, // GENERATED
          routeBuilder: (context, settings, child) {
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => child,
            );
          }),
      debugShowCheckedModeBanner: false,
      title: 'sad',
      themeMode: ThemeMode.light,
      // darkTheme: Style.dark,
      theme: Style.light,

      // home: const Startup(),
    );
  }
}
