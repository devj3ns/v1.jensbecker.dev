import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'routes.dart';
import 'theme.dart';

class MyApp extends StatelessWidget {
  final title = 'Jens Becker - Digital Creator';

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: title,
      theme: getThemeData(context),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerDelegate: beamerDelegate,
      routeInformationParser: BeamerRouteInformationParser(),
      builder: (context, child) => ScrollConfiguration(
        behavior: MyScrollBehavior(),
        child: child!,
      ),
    );
  }
}

/// A custom [ScrollBehavior] which is used to remove the scroll glow effect,
/// see https://stackoverflow.com/questions/51119795/how-to-remove-scroll-glow.
class MyScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}
