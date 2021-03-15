import 'package:flutter/material.dart';
import 'package:portfolio/shared/shared_widgets.dart';

import '../../shared/extensions.dart';
import '../section.dart';

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'Über mich',
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        runSpacing: 30,
        spacing: 25,
        children: [
          context.isMobile ? Center(child: _Image()) : _Image(),
          _Text(
            width: context.responsiveNumber(
              onMobile: double.infinity,
              onTablet: context.screenWidth / 2.5,
              onDesktop: context.screenWidth / 3,
            ),
          ),
        ],
      ),
    );
  }
}

class _Image extends StatelessWidget {
  final imageSize = 175.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: imageSize,
      height: imageSize,
      child: const ShadowBox(
        borderRadius: 100,
        child: CircleAvatar(
          backgroundImage: NetworkImage(
            'assets/jensbecker_small.jpg',
          ),
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}

class _Text extends StatelessWidget {
  const _Text({required this.width});
  final double width;

  int get jensAge {
    final birthday = DateTime(2001, 11, 16);
    final today = DateTime.now();

    return DateTime.fromMillisecondsSinceEpoch(
                today.difference(birthday).inMilliseconds)
            .year -
        1970;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          // just using the 👋 emoji in the text decreases performance drastically
          // see: https://github.com/flutter/flutter/issues/76248
          Row(
            children: [
              const SelectableText('Hey', style: TextStyle(fontSize: 18)),
              // unfortunately the svg does not work when viewing on a phone (because of the html renderer)
              const WinkingHandEmoji(),
            ],
          ),
          SelectableText(
            'mein Name ist Jens Becker, ich bin $jensAge Jahre alt und selbstständiger IT-Freelancer mit Schwerpunkt Softwareentwicklung.\n\n'
            'Im Jahr 2020 habe ich mich selbstständig gemacht und seitdem schon viele Projekte umgesetzt. Darunter Apps, Web-Apps, News-Bots und Webseiten für Kunden/Firmen.\n\n'
            'Aber auch bevor ich selbstständig war, habe ich viele Jahre Erfahrung beim Programmieren und Umsetzten eigener Projekte gesammelt.',
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
