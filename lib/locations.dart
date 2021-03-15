import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'home/home.dart';
import 'home/projects/projects.dart';
import 'pages/imprint_page.dart';
import 'pages/privacy_page.dart';

final beamLocations = <BeamLocation>[
  HomeLocation(),
  ProjectLocation(pathParameters: {}),
  ImprintLocation(),
  PrivacyLocation(),
  LicenceLocation(),
];

class HomeLocation extends BeamLocation {
  HomeLocation() : super(pathBlueprint: '/');

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
  ProjectLocation({
    required Map<String, String> pathParameters,
  }) : super(
          pathBlueprint: '/projects/:projectId/',
          pathParameters: pathParameters,
        );

  @override
  List<String> get pathBlueprints => ['/projects/:projectId/'];

  @override
  List<BeamPage> pagesBuilder(BuildContext? context) => [
        ...HomeLocation().pagesBuilder(context),
        BeamPage(
          key: ValueKey(pathParameters['projectId']),
          child: ProjectDetailPage(
            id: (pathParameters['projectId'])!,
          ),
        ),
      ];
}

class ImprintLocation extends BeamLocation {
  ImprintLocation() : super(pathBlueprint: '/impressum/');

  @override
  List<String> get pathBlueprints => ['/impressum/'];

  @override
  List<BeamPage> pagesBuilder(BuildContext? context) => [
        ...HomeLocation().pagesBuilder(context),
        BeamPage(
          key: const ValueKey('imprint'),
          child: ImprintPage(),
        ),
      ];
}

class PrivacyLocation extends BeamLocation {
  PrivacyLocation() : super(pathBlueprint: '/datenschutz/');

  @override
  List<String> get pathBlueprints => ['/datenschutz/'];

  @override
  List<BeamPage> pagesBuilder(BuildContext? context) => [
        ...HomeLocation().pagesBuilder(context),
        BeamPage(
          key: const ValueKey('privacy'),
          child: PrivacyPage(),
        ),
      ];
}

class LicenceLocation extends BeamLocation {
  LicenceLocation() : super(pathBlueprint: '/lizenzen/');

  @override
  List<String> get pathBlueprints => ['/lizenzen/'];

  @override
  List<BeamPage> pagesBuilder(BuildContext? context) => [
        ...HomeLocation().pagesBuilder(context),
        BeamPage(
          key: const ValueKey('licences'),
          child: const LicensePage(),
        ),
      ];
}
