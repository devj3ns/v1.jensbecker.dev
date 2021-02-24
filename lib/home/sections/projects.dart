import 'package:flutter/material.dart';

import '../../projects/projects.dart';

class ProjectsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 6, vertical: 75),
      child: Column(
        children: [
          const SelectableText(
            'Meine letzten Projekte',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 25),
          SizedBox(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: projects
                  .map((project) => ProjectDetailsCard(project))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
