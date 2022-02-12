import 'package:easy_localization/easy_localization.dart';
import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';

import '../../../../shared/widgets/widgets.dart';
import '../models/project.dart';

class ProjectDetailsCard extends StatelessWidget {
  const ProjectDetailsCard(this.project, {Key? key}) : super(key: key);
  final Project project;

  @override
  Widget build(BuildContext context) {
    return Box(
      padding: const EdgeInsets.all(16.0),
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              Image.asset(
                project.iconUrl,
                width: 50,
                height: 50,
              ),
              const Gap.w8(),
              Flexible(
                child: SelectableText(
                  project.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ],
          ),
          const Gap.h8(),
          Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 6,
            spacing: 6,
            children: project.tags.split(',').map(TextChip.new).toList(),
          ),
          const Gap.h12(),
          SelectableText(
            project.briefDescription,
            style: const TextStyle(fontSize: 16),
          ),
          const Gap.h4(),
          MyTextButton(
            link: Uri.parse('projects/${project.id}'),
            text: tr('projects_section_learn-more').toUpperCase(),
            textStyle: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
