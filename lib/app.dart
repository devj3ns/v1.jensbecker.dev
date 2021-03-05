import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'locations.dart';
import 'theme.dart';

class MyApp extends StatelessWidget {
  final title = 'Jens Becker - Digital Creator';

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: title,
      theme: getThemeData(context),
      debugShowCheckedModeBanner: false,
      routerDelegate: BeamerRouterDelegate(
        beamLocations: beamLocations,
        notFoundRedirect: HomeLocation(),
      ),
      routeInformationParser: BeamerRouteInformationParser(),
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyScrollBehavior(),
          child: child,
        );
      },
    );
  }
}

class MyScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
