import 'package:beamer/beamer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/link.dart';

import '../shared/shared_widgets.dart';
import 'home_page/projects_section/models/project_data.dart';

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage(this.project, {Key? key}) : super(key: key);
  final Project project;

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = context.formFactor == FormFactor.handset
        ? 15.0
        : context.screenWidth / 6;
    final verticalPadding =
        context.formFactor == FormFactor.handset ? 25.0 : 75.0;
    final horizontalImagePadding =
        context.formFactor == FormFactor.handset ? 0.0 : horizontalPadding / 2;

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
                  tooltip: tr('back-tooltip'),
                  onPressed: () {
                    context.canBeamBack
                        ? context.beamBack()
                        : context.beamToNamed('/');
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
            // todo: Translate images (mockups).
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalImagePadding),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Center(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: Image.asset(
                      project.mockupUrl,
                    ),
                  ),
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
                    .split(',')
                    .map((tag) => TextChip(text: tag))
                    .toList(),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                runSpacing: 4,
                spacing: 4,
                children:
                    project.tools.map((tag) => TextChip(text: tag)).toList(),
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
                    _StoreIcon(
                      store: _Store.playStore,
                      url: project.playStoreUrl!,
                    ),
                  if (project.appStoreUrl.isNotBlank) ...[
                    const SizedBox(width: 15),
                    _StoreIcon(
                      store: _Store.appStore,
                      url: project.appStoreUrl!,
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

enum _Store { appStore, playStore }

class _StoreIcon extends StatelessWidget {
  const _StoreIcon({
    Key? key,
    required this.url,
    required this.store,
  }) : super(key: key);

  final String url;
  final _Store store;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.formFactor == FormFactor.handset ? 40 : 50,
      child: Link(
        uri: Uri.parse(url),
        builder: (context, followLink) => InkWell(
          onTap: followLink,
          child: Image.asset(
              'assets/images/badges/${context.locale.languageCode}/${store == _Store.appStore ? 'app_store' : 'play_store'}_badge.png'),
        ),
      ),
    );
  }
}
