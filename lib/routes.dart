import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_extensions/flutter_extensions.dart';
import 'package:easy_localization/easy_localization.dart';

import 'pages/home_page/home_page.dart';
import 'pages/home_page/projects_section/data/projects.dart';
import 'pages/imprint_page.dart';
import 'pages/not_found_page.dart';
import 'pages/privacy_page.dart';
import 'pages/project_details_page.dart';

final routerDelegate = BeamerDelegate(
  locationBuilder: SimpleLocationBuilder(
    routes: <dynamic, dynamic Function(BuildContext, BeamState)>{
      '/': (context, state) => BeamPage(
            key: ValueKey('home-${context.locale}'),
            type: BeamPageType.noTransition,
            child: HomePage(),
          ),
      '/impressum': (context, state) => ImprintPage(),
      '/datenschutz': (context, state) => PrivacyPage(),
      '/lizenzen': (context, state) => const LicensePage(),
      '/projects/:projectId': (context, state) {
        final project = projects
            .find((project) => project.id == state.pathParameters['projectId']);

        return project != null
            ? ProjectDetailPage(project)
            : RouteNotFoundPage();
      }
    },
  ),
  setBrowserTabTitle: false,
  notFoundPage: BeamPage(
    child: RouteNotFoundPage(),
  ),
);
