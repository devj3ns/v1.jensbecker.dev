import 'package:flutter/material.dart';

import '../../extensions.dart';
import '../../routing.dart';
import '../models/project.dart';

class ProjectDetailsCard extends StatelessWidget {
  const ProjectDetailsCard(this.project);
  final Project project;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SelectableText(
                project.name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                project.descriptionShort,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    child: const Text('MEHR ERFAHREN'),
                    onPressed: () => AppRouter.router.navigateTo(
                      context,
                      AppRoutes.getDetailRoute(
                        AppRoutes.projectDetailRoute.route,
                        project.id,
                      ),
                    ),
                  ).moveUpOnHover,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
