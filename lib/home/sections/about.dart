import 'package:flutter/material.dart';

import '../../shared/extensions.dart';
import '../section.dart';

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'Über mich',
      subtitle: '',
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        runSpacing: 20,
        spacing: 20,
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
    return Container(
      width: imageSize,
      height: imageSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 15,
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: const CircleAvatar(
        backgroundImage: NetworkImage(
          'assets/jensbecker_small.jpg',
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

class _Text extends StatelessWidget {
  const _Text({@required this.width});
  final double width;

  @override
  Widget build(BuildContext context) {
    final birthday = DateTime(2001, 11, 16);
    final today = DateTime.now();

    final age = DateTime.fromMillisecondsSinceEpoch(
                today.difference(birthday).inMilliseconds)
            .year -
        1970;

    return SizedBox(
      width: width,
      child: SelectableText(
        'Hey 👋\n'
        'mein Name ist Jens Becker, ich bin $age Jahre alt und selbstständiger IT-Freelancer mit Schwerpunkt Softwareentwicklung.\n\n'
        'Im Jahr 2020 habe ich mich selbstständig gemacht und seitdem schon viele Projekte umgesetzt. Darunter Apps, Web-Apps, News-Bots und Webseiten für Kunden/Firmen.\n\n'
        'Aber auch bevor ich selbstständig war, habe ich viele Jahre Erfahrung beim Programmieren und Umsetzten eigener Projekte gesammelt.',
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
