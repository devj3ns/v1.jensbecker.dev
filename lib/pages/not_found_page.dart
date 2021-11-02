import 'package:beamer/beamer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../shared/shared_widgets.dart';

class RouteNotFoundPage extends StatelessWidget {
  const RouteNotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fontSize = context.byFormFactor<double>(
        onHandset: 25, onTablet: 28, onDesktop: 30);

    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 750),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AspectRatio(
                aspectRatio: 4 / 3,
                child: AnimateVerticalTranslate(
                  duration: const Duration(milliseconds: 1500),
                  tweenBegin: -4,
                  tweenEnd: 4,
                  child: Image.asset('assets/images/404.png'),
                ),
              ),
              SelectableText(
                tr('page-not-found'),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: fontSize),
              ),
              const SizedBox(height: 15),
              Button(
                text: tr('home-page'),
                iconData: FontAwesomeIcons.chevronLeft,
                alignIcon: AlignIcon.beforeText,
                onPressed: () => context.beamToNamed('/'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
