import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'home/home.dart';
import 'projects/projects.dart';

@immutable
class AppRouter {
  const AppRouter({
    @required List<AppRoute> routes,
    @required Handler notFoundHandler,
  })  : _routes = routes,
        _notFoundHandler = notFoundHandler;

  static FluroRouter router = FluroRouter.appRouter;

  final List<AppRoute> _routes;
  final Handler _notFoundHandler;

  List<AppRoute> get routes => _routes;

  void setupRoutes() {
    router.notFoundHandler = _notFoundHandler;
    // ignore: avoid_function_literals_in_foreach_calls
    routes.forEach(
      (AppRoute route) =>
          router.define(route.route, handler: route.handler as Handler),
    );
  }
}

class AppRoutes {
  static final routeNotFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    // todo navigate to home and set url to '/'
    debugPrint('route not found');
    return HomePage();
  });

  static final rootRoute = AppRoute(
    '/',
    Handler(
      handlerFunc: (context, parameters) => HomePage(),
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

  static final List<AppRoute> routes = [
    rootRoute,
    projectDetailRoute,
  ];
}
