import 'package:flutter/material.dart';

import '../../../../shared/shared_widgets.dart';
import '../model/social_icon.dart';

class SocialIconButton extends StatelessWidget {
  const SocialIconButton(this.socialIconData, {Key? key}) : super(key: key);
  final SocialIconData socialIconData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: MyIconButton(
        link: socialIconData.link,
        icon: socialIconData.icon,
        size: 32,
        color: Colors.white,
      ),
    );
  }
}
