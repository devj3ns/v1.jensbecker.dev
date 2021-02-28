import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'home/home.dart';
import 'imprint_page.dart';
import 'privacy_page.dart';
import 'projects/projects.dart';

@immutable
class AppRouter {
  const AppRouter({
    @required List<AppRoute> routes,
  }) : _routes = routes;

  static FluroRouter router = FluroRouter.appRouter;
  final List<AppRoute> _routes;
  List<AppRoute> get routes => _routes;

  void setupRoutes() {
    // ignore: avoid_function_literals_in_foreach_calls
    routes.forEach(
      (AppRoute route) =>
          router.define(route.route, handler: route.handler as Handler),
    );
  }
}

class AppRoutes {
  static final List<AppRoute> routes = [
    rootRoute,
    projectDetailRoute,
    imprintRoute,
    privacyRoute,
    licenceRoute,
  ];

  static final rootRoute = AppRoute(
    '/',
    Handler(
      handlerFunc: (context, parameters) => HomePage(),
    ),
  );

  static final imprintRoute = AppRoute(
    '/impressum',
    Handler(
      handlerFunc: (context, parameters) => ImprintPage(),
    ),
  );

  static final privacyRoute = AppRoute(
    '/datenschutz',
    Handler(
      handlerFunc: (context, parameters) => PrivacyPage(),
    ),
  );

  static final licenceRoute = AppRoute(
    '/lizenzen',
    Handler(
      handlerFunc: (context, parameters) => const LicensePage(),
    ),
  );

  static final projectDetailRoute = AppRoute(
    '/projekt/:id',
    Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      final projectId = params['id'][0];

      return ProjectDetailPage(id: projectId);
    }),
  );

  /// Primitive function to get one param detail route (i.e. id).
  static String getDetailRoute(String parentRoute, String id) {
    return parentRoute.replaceFirst(':id', id);
  }
}
