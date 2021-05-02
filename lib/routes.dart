import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_extensions/flutter_extensions.dart';

import 'pages/home_page/home_page.dart';
import 'pages/home_page/projects_section/data/projects.dart';
import 'pages/imprint_page.dart';
import 'pages/not_found_page.dart';
import 'pages/privacy_page.dart';
import 'pages/project_details_page.dart';

final beamerDelegate = BeamerRouterDelegate(
  locationBuilder: SimpleLocationBuilder(
    routes: {
      '/': (context) => HomePage(),
      '/impressum': (context) => ImprintPage(),
      '/datenschutz': (context) => PrivacyPage(),
      '/lizenzen': (context) => const LicensePage(),
      '/projects/:projectId': (context) {
        final projectId =
            context.currentBeamLocation.state.pathParameters['projectId'];
        final project = projects.find((project) => project.id == projectId);

        return project != null
            ? ProjectDetailPage(project)
            : RouteNotFoundPage();
      }
    },
  ),
  notFoundPage: BeamPage(
    child: RouteNotFoundPage(),
  ),
);
