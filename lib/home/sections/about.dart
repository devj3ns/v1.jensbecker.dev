import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/shared/shared_widgets.dart';

import '../../shared/extensions.dart';
import '../section.dart';

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Section(
      title: tr('about-me_section_title'),
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
          backgroundImage: AssetImage(
            'assets/images/jensbecker_small.jpg',
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

  String get jensAge {
    final birthday = DateTime(2001, 11, 16);
    final today = DateTime.now();

    return (DateTime.fromMillisecondsSinceEpoch(
                    today.difference(birthday).inMilliseconds)
                .year -
            1970)
        .toString();
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
            tr('about-me_section_text', namedArgs: {'age': jensAge}),
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
