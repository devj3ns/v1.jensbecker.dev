import 'package:flutter/material.dart';

import '../../extensions.dart';
import '../../routing.dart';
import '../models/project.dart';

class ProjectDetailsCard extends StatelessWidget {
  const ProjectDetailsCard(this.project);
  final Project project;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                if (project.iconUrl.isNotBlank) ...[
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.network(
                      project.iconUrl,
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
                Flexible(
                  child: SelectableText(
                    project.name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Chips(project: project),
            const SizedBox(height: 5),
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
    );
  }
}

class Chips extends StatelessWidget {
  const Chips({@required this.project});
  final Project project;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Wrap(
          alignment: WrapAlignment.center,
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
        /*const SizedBox(height: 10),
        Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 4,
          spacing: 4,
          children: project.tools
              .map(
                (tag) => Chip(
                  label: SelectableText(tag),
                ),
              )
              .toList(),
        ),*/
      ],
    );
  }
}
