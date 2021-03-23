import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'home/home.dart';
import 'home/projects/projects.dart';
import 'pages/imprint_page.dart';
import 'pages/privacy_page.dart';

final beamLocations = <BeamLocation>[
  HomeLocation(),
  ProjectLocation(''),
  ImprintLocation(),
  PrivacyLocation(),
  LicenceLocation(),
];

class HomeLocation extends BeamLocation {
  @override
  List<String> get pathBlueprints => ['/'];

  @override
  List<BeamPage> pagesBuilder(BuildContext? context) => [
        BeamPage(
          key: const ValueKey('home'),
          child: HomePage(),
        ),
      ];
}

class ProjectLocation extends BeamLocation {
  ProjectLocation(String projectId)
      : super(
          state: BeamState(
            pathBlueprintSegments: ['projects', ':projectId'],
            pathParameters: {'projectId': projectId},
          ),
        );

  Project? get project {
    if (state.pathParameters.containsKey('projectId')) {
      final index = projects.indexWhere(
          (project) => project.id == state.pathParameters['projectId']);

      if (index != -1) {
        return projects[index];
      }
    }
  }

  @override
  List<String> get pathBlueprints => ['projects/:projectId'];

  @override
  List<BeamPage> pagesBuilder(BuildContext context) => [
        ...HomeLocation().pagesBuilder(context),
        if (project != null)
          BeamPage(
            key: ValueKey('project-${project!.id}'),
            child: ProjectDetailPage(project!),
          ),
      ];
}

class ImprintLocation extends BeamLocation {
  ImprintLocation()
      : super(state: BeamState(pathBlueprintSegments: ['impressum']));

  @override
  List<String> get pathBlueprints => ['impressum'];

  @override
  List<BeamPage> pagesBuilder(BuildContext context) => [
        ...HomeLocation().pagesBuilder(context),
        BeamPage(
          key: const ValueKey('imprint'),
          child: ImprintPage(),
        ),
      ];
}

class PrivacyLocation extends BeamLocation {
  PrivacyLocation()
      : super(state: BeamState(pathBlueprintSegments: ['datenschutz']));

  @override
  List<String> get pathBlueprints => ['datenschutz'];

  @override
  List<BeamPage> pagesBuilder(BuildContext context) => [
        ...HomeLocation().pagesBuilder(context),
        BeamPage(
          key: const ValueKey('privacy'),
          child: PrivacyPage(),
        ),
      ];
}

class LicenceLocation extends BeamLocation {
  LicenceLocation()
      : super(state: BeamState(pathBlueprintSegments: ['lizenzen']));

  @override
  List<String> get pathBlueprints => ['lizenzen'];

  @override
  List<BeamPage> pagesBuilder(BuildContext context) => [
        ...HomeLocation().pagesBuilder(context),
        BeamPage(
          key: const ValueKey('licences'),
          child: const LicensePage(),
        ),
      ];
}
