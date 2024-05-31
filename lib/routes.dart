import 'package:routefly/routefly.dart';

import 'app/app_page.dart' as a8;
import 'app/user/add_node_page.dart' as a3;
import 'app/user/add_wallet_page.dart' as a4;
import 'app/user/login_page.dart' as a1;
import 'app/user/main_page.dart' as a5;
import 'app/user/profile_page.dart' as a7;
import 'app/user/setting_page.dart' as a6;
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
    key: '/user/add_node',
    uri: Uri.parse('/user/add_node'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a3.AddNodePage(),
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
    key: '/user/main',
    uri: Uri.parse('/user/main'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a5.MyHomePage(),
    ),
  ),
  RouteEntity(
    key: '/user/setting',
    uri: Uri.parse('/user/setting'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a6.SettingPage(),
    ),
  ),
  RouteEntity(
    key: '/user/profile',
    uri: Uri.parse('/user/profile'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a7.ProfilePage(),
    ),
  ),
  RouteEntity(
    key: '/',
    uri: Uri.parse('/'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a8.AppPage(),
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
    addNode: '/user/add_node',
    addWallet: '/user/add_wallet',
    main: '/user/main',
    setting: '/user/setting',
    profile: '/user/profile',
  ),
);
