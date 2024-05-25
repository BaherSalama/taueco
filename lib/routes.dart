import 'package:routefly/routefly.dart';

import 'app/app_page.dart' as a3;
import 'app/user/main_page.dart' as a0;
import 'app/user/signup_page.dart' as a1;
import 'app/user/test_page.dart' as a2;

List<RouteEntity> get routes => [
  RouteEntity(
    key: '/user/main',
    uri: Uri.parse('/user/main'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a0.MyHomePage(),
    ),
  ),
  RouteEntity(
    key: '/user/signup',
    uri: Uri.parse('/user/signup'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a1.SignupPage(),
    ),
  ),
  RouteEntity(
    key: '/user/test',
    uri: Uri.parse('/user/test'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a2.TestPage(),
    ),
  ),
  RouteEntity(
    key: '/',
    uri: Uri.parse('/'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a3.AppPage(),
    ),
  ),
];

const routePaths = (
  path: '/',
  user: (
    path: '/user',
    main: '/user/main',
    signup: '/user/signup',
    test: '/user/test',
  ),
);
