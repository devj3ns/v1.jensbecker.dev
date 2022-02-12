import 'package:easy_localization/easy_localization.dart';
import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/widgets/widgets.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final additionalMargin = context.byFormFactor<EdgeInsets>(
      onMobile: EdgeInsets.zero,
      onTablet: EdgeInsets.zero,
      onDesktop: EdgeInsets.symmetric(
        horizontal: context.screenWidth > 1300 ? context.screenWidth / 8 : 0,
      ),
    );

    return Section(
      title: tr('about-me_section_title'),
      additionalMargin: additionalMargin,
      child: context.byFormFactor<Widget>(
        onMobile: Column(
          children: const [
            Center(child: _Image()),
            Gap.h16(),
            _Text(),
          ],
        ),
        onTablet: Row(
          children: const [
            _Image(),
            Gap.w16(),
            Flexible(child: _Text()),
          ],
        ),
        onDesktop: Row(
          children: const [
            _Image(),
            Gap.w32(),
            Flexible(child: _Text()),
          ],
        ),
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const radius = 100.0;

    return const Box(
      borderRadius: radius,
      shadow: true,
      child: CircleAvatar(
        backgroundImage: AssetImage(
          'assets/images/jensbecker_small.jpg',
        ),
        backgroundColor: Colors.transparent,
        radius: radius,
      ),
    );
  }
}

class _Text extends StatelessWidget {
  const _Text({Key? key}) : super(key: key);

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Just using the 👋 emoji in the text decreases performance drastically.
        // See: https://github.com/flutter/flutter/issues/76248
        Row(
          children: [
            const SelectableText('Hey', style: TextStyle(fontSize: 18)),
            SvgPicture.asset(
              'assets/images/emoji_u1f44b.svg',
              semanticsLabel: 'Winking hand emoji',
              width: 22,
              height: 22,
            ),
          ],
        ),
        SelectableText(
          tr('about-me_section_text', namedArgs: {'age': jensAge}),
          style: const TextStyle(fontSize: 18),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
