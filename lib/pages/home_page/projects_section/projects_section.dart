import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../shared/constants.dart';
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
          RoundedBox(
            color: Colors.transparent,
            shadow: true,
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: projects.map(ProjectDetailsCard.new).toList(),
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
          MyElevatedButton(
            label: 'GitHub',
            iconAfter: FontAwesomeIcons.github,
            link: Uri.parse(kGitHubLink),
          ),
        ],
      ),
    );
  }
}
