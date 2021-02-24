import 'package:flutter/material.dart';

import '../data/projects.dart';

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage({@required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    final project = projects.firstWhere((project) => project.id == id);

    return Scaffold(
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SelectableText(
                  project.name,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10),
                Wrap(
                  runSpacing: 4,
                  spacing: 4,
                  children: project.tags
                      .map(
                        (tag) => Chip(
                          label: SelectableText(tag),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 10),
                Wrap(
                  runSpacing: 4,
                  spacing: 4,
                  children: project.tools
                      .map(
                        (tag) => Chip(
                          label: SelectableText(tag),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 10),
                SelectableText(
                  project.description,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
