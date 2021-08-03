import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../shared/shared_widgets.dart';
import 'data/projects.dart';
import 'widgets/project_details_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Section(
      title: tr('projects_section_title'),
      subtitle: tr('projects_section_subtitle'),
      topMarginMultiplier: 2,
      child: Column(
        children: [
          ShadowBox(
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: projects
                  .map((project) => ProjectDetailsCard(project))
                  .toList(),
            ),
          ),
          const SizedBox(height: 35),
           SelectableText(
            tr('projects_open_source_info'),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w200,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          Button(
            text: 'GitHub',
            iconData: FontAwesomeIcons.github,
            onPressed: () => launch('https://github.com/devj3ns'),
          ),
        ],
      ),
    );
  }
}
