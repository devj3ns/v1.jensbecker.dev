import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'home/home.dart';
import 'home/projects/projects.dart';
import 'pages/imprint_page.dart';
import 'pages/not_found_page.dart';
import 'pages/privacy_page.dart';

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

        if (projectId != null) {
          final projectIndex =
              projects.indexWhere((project) => project.id == projectId);
          final project = projectIndex != -1 ? projects[projectIndex] : null;

          if (project != null) return ProjectDetailPage(project);
        }

        return RouteNotFoundPage();
      }
    },
  ),
  notFoundPage: BeamPage(
    child: RouteNotFoundPage(),
  ),
);
