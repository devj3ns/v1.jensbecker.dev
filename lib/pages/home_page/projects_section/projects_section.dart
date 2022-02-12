import 'package:easy_localization/easy_localization.dart';
import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../shared/constants.dart';
import '../../../shared/widgets/widgets.dart';
import 'data/projects.dart';
import 'widgets/project_details_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final columns =
        context.byFormFactor<int>(onMobile: 1, onTablet: 2, onDesktop: 3);

    return Section(
      title: tr('projects_section_title'),
      subtitle: tr('projects_section_subtitle'),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Box(
            shadow: true,
            child: AlignedGridView.count(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              crossAxisCount: columns,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              itemCount: projects.length,
              itemBuilder: (context, index) =>
                  ProjectDetailsCard(projects[index]),
            ),
          ),
          const Gap.h32(),
          SelectableText(
            tr('projects_open_source_info'),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w200,
            ),
            textAlign: TextAlign.center,
          ),
          const Gap.h8(),
          MyElevatedButton(
            label: 'GitHub',
            iconAfter: FontAwesomeIcons.github,
            link: Uri.parse(kGitHubLink),
          ),
        ],
      ),
    );
  }
}
