import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';

import '../../../locations.dart';
import '../../../shared/extensions.dart';
import '../../../shared/shared_widgets.dart';
import '../models/project.dart';

class ProjectDetailsCard extends StatelessWidget {
  const ProjectDetailsCard(this.project);
  final Project project;

  @override
  Widget build(BuildContext context) {
    final height = context.responsiveNullableNumber(
        onMobile: null, onTablet: 325, onDesktop: 250);
    final width = context.responsiveNullableNumber(
        onMobile: null, onTablet: 300, onDesktop: 450);

    return SizedBox(
      height: height,
      width: width,
      child: RoundedBox(
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
            const SizedBox(height: 10),
            Chips(project: project),
            const SizedBox(height: 10),
            SelectableText(
              project.descriptionShort,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 5),
            Center(
              child: TextButton(
                onPressed: () => context.beamTo(ProjectLocation(project.id)),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('MEHR ERFAHREN'),
                ),
              ).floatOnHover(),
            ),
          ],
        ),
      ),
    );
  }
}

class Chips extends StatelessWidget {
  const Chips({required this.project});
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
                (tag) => TextChip(text: tag),
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
                (tag) => TextChip(
                  text: SelectableText(tag),
                ),
              )
              .toList(),
        ),*/
      ],
    );
  }
}
