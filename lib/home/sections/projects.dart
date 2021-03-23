import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../shared/shared_widgets.dart';
import '../projects/projects.dart';
import '../section.dart';

class ProjectsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Section(
      title: tr('projects_section_title'),
      subtitle: tr('projects_section_subtitle'),
      doubleTopMargin: true,
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
