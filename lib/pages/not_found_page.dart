import 'package:easy_localization/easy_localization.dart';
import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../shared/extensions.dart';
import '../shared/widgets/widgets.dart';

class RouteNotFoundPage extends StatelessWidget {
  const RouteNotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: context.contentMargin,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: context.byFormFactor(
                    onMobile: double.infinity,
                    onTablet: 400,
                    onDesktop: 600,
                  ),
                ),
                child: AspectRatio(
                  aspectRatio: 4 / 3,
                  child: AnimateVerticalTranslate(
                    duration: const Duration(milliseconds: 1500),
                    tweenBegin: -4,
                    tweenEnd: 4,
                    child: Image.asset('assets/images/404.png'),
                  ),
                ),
              ),
              SelectableText(
                tr('page-not-found'),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 23),
              ),
              const Gap.h16(),
              MyElevatedButton(
                iconBefore: FontAwesomeIcons.chevronLeft,
                label: tr('home-page'),
                link: Uri.parse('/'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
