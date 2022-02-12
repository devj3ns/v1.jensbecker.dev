import 'package:beamer/beamer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';

import '../pages/home_page/home_page.dart';
import '../pages/home_page/projects_section/data/projects.dart';
import '../pages/imprint_page.dart';
import '../pages/not_found_page.dart';
import '../pages/privacy_page.dart';
import '../pages/project_details_page.dart';

final routerDelegate = BeamerDelegate(
  locationBuilder: RoutesLocationBuilder(
    routes: {
      '/': (context, _, __) => BeamPage(
            key: ValueKey('home-${context.locale}'),
            type: BeamPageType.noTransition,
            child: const HomePage(),
          ),
      '/impressum': (context, _, __) => const ImprintPage(),
      '/datenschutz': (context, _, __) => const PrivacyPage(),
      '/lizenzen': (context, state, _) => const LicensePage(),
      '/projects/:projectId': (context, state, _) {
        final project = projects
            .find((project) => project.id == state.pathParameters['projectId']);

        return project != null
            ? ProjectDetailPage(project)
            : const RouteNotFoundPage();
      }
    },
  ),
  setBrowserTabTitle: false,
  notFoundPage: const BeamPage(
    child: RouteNotFoundPage(),
  ),
);
