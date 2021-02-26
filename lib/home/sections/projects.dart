import 'package:flutter/material.dart';

import '../../projects/projects.dart';
import '../section.dart';

class ProjectsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'Meine letzten Projekte',
      subtitle:
          'Eine Auswahl an Projekten an denen ich zuletzt gearbeitet habe.',
      applyHorizontalMargin: false,
      doubleTopMargin: true,
      child: Center(
        child: SizedBox(
          height: 575,
          child: GridView.count(
            childAspectRatio: 3 / 4,
            crossAxisCount: 2,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            children:
                projects.map((project) => ProjectDetailsCard(project)).toList(),
          ),
        ),
      ),
    );
  }
}
