import 'package:flutter/material.dart';

import '../../projects/projects.dart';
import 'section.dart';

class ProjectsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'Meine letzten Projekte',
      child: SizedBox(
        height: 250,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children:
              projects.map((project) => ProjectDetailsCard(project)).toList(),
        ),
      ),
    );
  }
}
