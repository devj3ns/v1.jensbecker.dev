import 'package:easy_localization/easy_localization.dart';
import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/shared_widgets.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Section(
      title: tr('about-me_section_title'),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        runSpacing: 30,
        spacing: 25,
        children: [
          context.formFactor == FormFactor.handset
              ? Center(child: _Image())
              : _Image(),
          _Text(
            width: context.byFormFactor<double>(
              onHandset: double.infinity,
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
          // Just using the 👋 emoji in the text decreases performance drastically.
          // See: https://github.com/flutter/flutter/issues/76248
          Row(
            children: const [
              SelectableText('Hey', style: TextStyle(fontSize: 18)),
              _WinkingHandEmoji(),
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

// NOTE: The SVG does not work with the html renderer.
class _WinkingHandEmoji extends StatelessWidget {
  const _WinkingHandEmoji({this.size = 22});
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: SvgPicture.asset(
        'assets/images/emoji_u1f44b.svg',
        semanticsLabel: 'Winking hand emoji',
      ),
    );
  }
}
