import 'package:easy_localization/easy_localization.dart';
import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';

import '../../../../shared/shared_widgets.dart';
import '../models/project_data.dart';

class ProjectDetailsCard extends StatelessWidget {
  const ProjectDetailsCard(this.project, {Key? key}) : super(key: key);
  final Project project;

  @override
  Widget build(BuildContext context) {
    final height = context.byFormFactor<double?>(
        onHandset: null, onTablet: 325, onDesktop: 250);
    final width = context.byFormFactor<double?>(
        onHandset: null, onTablet: 300, onDesktop: 450);

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
                    child: Image.asset(
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
            _Chips(project: project),
            const SizedBox(height: 10),
            SelectableText(
              project.briefDescription,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 5),
            Center(
              child: MyTextButton(
                link: Uri.parse('projects/${project.id}'),
                label: tr('projects_section_learn-more').toUpperCase(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Chips extends StatelessWidget {
  const _Chips({required this.project, Key? key}) : super(key: key);
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
              .split(',')
              .map(
                (tag) => TextChip(text: tag),
              )
              .toList(),
        ),
      ],
    );
  }
}
