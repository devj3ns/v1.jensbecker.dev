import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

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
      child: ShadowBox(
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          children:
              projects.map((project) => ProjectDetailsCard(project)).toList(),
        ),
      ),
    );
  }
}
