import 'package:beamer/beamer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/link.dart';

import '../shared/extensions.dart';
import '../shared/widgets/widgets.dart';
import 'home_page/projects_section/models/project.dart';

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage(this.project, {Key? key}) : super(key: key);
  final Project project;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          padding: context.contentMargin,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyIconButton(
                  icon: FontAwesomeIcons.chevronLeft,
                  floatOnHover: false,
                  iconColor: Colors.black87,
                  iconSize: 22,
                  onPressed: () => context.canBeamBack
                      ? context.beamBack()
                      : context.beamToNamed('/'),
                ),
                const Gap.w4(),
                Flexible(
                  child: SelectableText(
                    project.name,
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
              ],
            ),
            const Gap.h16(),
            // todo: Translate images (mockups).
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                // Use AspectRatio so that the images area is also blocked while loading
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
            ),
            const Gap.h16(),
            Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                runSpacing: 4,
                spacing: 4,
                children: project.tags.split(',').map(TextChip.new).toList(),
              ),
            ),
            const Gap.h12(),
            Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                runSpacing: 4,
                spacing: 4,
                children: project.tools.map(TextChip.new).toList(),
              ),
            ),
            const Gap.h32(),
            SelectableText(
              project.description,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            if (project.playStoreUrl.isNotBlank ||
                project.appStoreUrl.isNotBlank) ...[
              const Gap.h32(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (project.playStoreUrl.isNotBlank)
                    _StoreIcon(
                      store: _Store.playStore,
                      url: project.playStoreUrl!,
                    ),
                  if (project.appStoreUrl.isNotBlank) ...[
                    const Gap.w16(),
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
      height: context.formFactor().isMobile ? 40 : 50,
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
