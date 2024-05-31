import 'package:routefly/routefly.dart';

import 'app/app_page.dart' as a6;
import 'app/user/add_node_page.dart' as a5;
import 'app/user/add_wallet_page.dart' as a4;
import 'app/user/login_page.dart' as a1;
import 'app/user/main_page.dart' as a3;
import 'app/user/signup_page.dart' as a2;
import 'app/user/test_page.dart' as a0;

List<RouteEntity> get routes => [
  RouteEntity(
    key: '/user/test',
    uri: Uri.parse('/user/test'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a0.TestPage(),
    ),
  ),
  RouteEntity(
    key: '/user/login',
    uri: Uri.parse('/user/login'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a1.LoginPage(),
    ),
  ),
  RouteEntity(
    key: '/user/signup',
    uri: Uri.parse('/user/signup'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a2.SignupPage(),
    ),
  ),
  RouteEntity(
    key: '/user/main',
    uri: Uri.parse('/user/main'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a3.MyHomePage(),
    ),
  ),
  RouteEntity(
    key: '/user/add_wallet',
    uri: Uri.parse('/user/add_wallet'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a4.SignupPage(),
    ),
  ),
  RouteEntity(
    key: '/user/add_node',
    uri: Uri.parse('/user/add_node'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a5.AddNodePage(),
    ),
  ),
  RouteEntity(
    key: '/',
    uri: Uri.parse('/'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a6.AppPage(),
    ),
  ),
];

const routePaths = (
  path: '/',
  user: (
    path: '/user',
    test: '/user/test',
    login: '/user/login',
    signup: '/user/signup',
    main: '/user/main',
    addWallet: '/user/add_wallet',
    addNode: '/user/add_node',
  ),
);
