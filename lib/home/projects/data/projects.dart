import 'package:easy_localization/easy_localization.dart';

import '../models/project.dart';

String _getMockupPath(String imageName) =>
    '/assets/projects/mockups/$imageName';
String _getIconPath(String imageName) => '/assets/projects/icons/$imageName';

// This is a getter and not just a variable because then the translations wouldn't get updated
List<Project> get projects => [
      Project(
        id: 'nestwaerme-kita-app',
        name: tr('projects_nestwaerme-kita-app_name'),
        tags: tr('projects_nestwaerme-kita-app_tags'),
        tools: ['Flutter', 'Dart', 'Firebase'],
        iconUrl: _getIconPath('nestwaerme_kita.png'),
        mockupUrl: _getMockupPath('nestwaerme_kita.png'),
        briefDescription: tr('projects_nestwaerme-kita-app_brief-description'),
        description: tr('projects_nestwaerme-kita-app_description'),
        appStoreUrl:
            'https://apps.apple.com/de/app/nestw%C3%A4rme-kita/id1550933241#?platform=iphone',
        playStoreUrl:
            'https://play.google.com/store/apps/details?id=de.jensbecker.nestwaerme_kita_app',
      ),
      Project(
        id: 'nestwaerme-blickwechsel-buchungsassistent',
        name: tr('projects_nestwaerme-blickwechsel-buchungsassistent_name'),
        tags: tr('projects_nestwaerme-blickwechsel-buchungsassistent_tags'),
        tools: ['Django', 'Python', 'MySQL'],
        iconUrl: _getIconPath('nestwaerme_blickwechsel.png'),
        mockupUrl: _getMockupPath('nestwaerme_blickwechsel.png'),
        briefDescription: tr(
            'projects_nestwaerme-blickwechsel-buchungsassistent_brief-description'),
        description: tr(
            'projects_nestwaerme-blickwechsel-buchungsassistent_description'),
      ),
      Project(
        id: 'muskelwerkstatt-mehr-performance-onlinebereich',
        name:
            tr('projects_muskelwerkstatt-mehr-performance-onlinebereich_name'),
        tags:
            tr('projects_muskelwerkstatt-mehr-performance-onlinebereich_tags'),
        tools: ['Django', 'Python', 'MySQL'],
        iconUrl: _getIconPath('muskelwerkstatt.png'),
        mockupUrl: _getMockupPath('muskelwerkstatt.png'),
        briefDescription: tr(
            'projects_muskelwerkstatt-mehr-performance-onlinebereich_brief-description'),
        description: tr(
            'projects_muskelwerkstatt-mehr-performance-onlinebereich_description'),
      ),
      Project(
        id: 'fleischerei-martin-click-und-collect',
        name: tr('projects_fleischerei-martin-click-und-collect_name'),
        tags: tr('projects_fleischerei-martin-click-und-collect_tags'),
        tools: ['Django', 'Python', 'MySQL'],
        iconUrl: _getIconPath('fleischerei_martin.png'),
        mockupUrl: _getMockupPath('fleischerei_martin.png'),
        briefDescription: tr(
            'projects_fleischerei-martin-click-und-collect_brief-description'),
        description:
            tr('projects_fleischerei-martin-click-und-collect_description'),
      ),
      Project(
        id: 'martin-ternes-mandantenportal',
        name: tr('projects_martin-ternes-mandantenportal_name'),
        tags: tr('projects_martin-ternes-mandantenportal_tags'),
        tools: ['Django', 'Python', 'MySQL'],
        iconUrl: _getIconPath('martin_ternes.png'),
        mockupUrl: _getMockupPath('martin_ternes.png'),
        briefDescription:
            tr('projects_martin-ternes-mandantenportal_brief-description'),
        description: tr('projects_martin-ternes-mandantenportal_description'),
      ),
      Project(
        id: 'trading-newsbots',
        name: tr('projects_trading-newsbots_name'),
        tags: tr('projects_trading-newsbots_tags'),
        tools: ['Python', 'Twitter API'],
        iconUrl: _getIconPath('trading.png'),
        mockupUrl: _getMockupPath('trading.png'),
        briefDescription: tr('projects_trading-newsbots_brief-description'),
        description: tr('projects_trading-newsbots_description'),
      ),
    ];
