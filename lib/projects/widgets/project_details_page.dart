import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/routing.dart';

import '../../extensions.dart';
import '../data/projects.dart';

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage({@required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    final project = projects.firstWhere((project) => project.id == id);
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
                  onPressed: () => AppRouter.router.pop<void>(context),
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
                ),
              ),
            ),
            const SizedBox(height: 15),
            Center(
              child: Wrap(
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
            ),
            const SizedBox(height: 10),
            Center(
              child: Wrap(
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
            ),
            const SizedBox(height: 30),
            SelectableText(
              project.description,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
