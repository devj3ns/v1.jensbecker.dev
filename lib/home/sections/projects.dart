import 'package:flutter/material.dart';

import '../projects/projects.dart';
import '../section.dart';

class ProjectsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'Meine letzten Projekte',
      subtitle:
          'Eine Auswahl an Projekten, an denen ich zuletzt gearbeitet habe.',
      doubleTopMargin: true,
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children:
            projects.map((project) => ProjectDetailsCard(project)).toList(),
      ),
    );
  }
}
