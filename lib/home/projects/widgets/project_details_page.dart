import 'package:beamer/beamer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/locations.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../shared/extensions.dart';
import '../../../shared/shared_widgets.dart';
import '../../projects/models/project.dart';

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage(this.project);
  final Project project;

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = context.isMobile ? 15.0 : context.screenWidth / 6;
    final verticalPadding = context.isMobile ? 25.0 : 75.0;
    final horizontalImagePadding =
        context.isMobile ? 0.0 : horizontalPadding / 2;

    return Scaffold(
      body: Center(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  tooltip: 'Zurück',
                  onPressed: () {
                    Beamer.of(context).canBeamBack
                        ? context.beamBack()
                        : context.beamTo(HomeLocation());
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.chevronLeft,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 5),
                Flexible(
                  child: SelectableText(
                    project.name,
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalImagePadding),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  project.mockupUrl,
                  fit: BoxFit.fill,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;

                    return const AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 15),
            Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                runSpacing: 4,
                spacing: 4,
                children: project.tags
                    .map(
                      (tag) => TextChip(text: tag),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                runSpacing: 4,
                spacing: 4,
                children: project.tools
                    .map(
                      (tag) => TextChip(text: tag),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 30),
            SelectableText(
              project.description,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            if (project.playStoreUrl.isNotBlank ||
                project.appStoreUrl.isNotBlank) ...[
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (project.playStoreUrl.isNotBlank)
                    SizedBox(
                      height: context.isMobile ? 40 : 50,
                      child: InkWell(
                        onTap: () => launch(project.playStoreUrl!),
                        child: Image.network('/assets/play_store_badge.png'),
                      ),
                    ),
                  if (project.appStoreUrl.isNotBlank) ...[
                    const SizedBox(width: 15),
                    SizedBox(
                      height: context.isMobile ? 40 : 50,
                      child: InkWell(
                        onTap: () => launch(project.appStoreUrl!),
                        child: Image.network('/assets/app_store_badge.png'),
                      ),
                    ),
                  ]
                ],
              )
            ]
          ],
        ),
      ),
    );
  }
}
