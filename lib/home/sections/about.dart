import 'package:flutter/material.dart';

import '../../shared/extensions.dart';
import '../section.dart';

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'Über mich',
      subtitle: '',
      child: context.isMobile
          ? Column(
              children: [
                _Image(),
                const SizedBox(height: 30),
                const _Text(
                  width: double.infinity,
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _Image(),
                const SizedBox(width: 30),
                _Text(
                  width: context.isTablet
                      ? context.screenWidth / 2.5
                      : context.screenWidth / 3,
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
          'assets/icon.jpg',
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
        'mein Name ist Jens Becker, ich bin $age Jahre alt und Selbstständiger IT-Freelancer mit Schwerpunkt Softwareentwicklung.\n\n'
        'Im Jahr 2020 habe ich mich selbstständig gemacht und seit dem schon viele Projekte umgesetzt. Darunter Apps, Web-Apps, News-Bots und Websites für Kunden/Firmen.\n\n'
        'Aber auch bevor ich selbstständig war, habe ich viele Jahre Erfahrung beim Programmieren und Umsetzten eigener Projekte gesammelt.',
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
