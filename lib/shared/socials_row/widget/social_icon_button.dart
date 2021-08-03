import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../shared/shared_widgets.dart';
import '../model/social_icon.dart';

class SocialIconButton extends StatelessWidget {
  const SocialIconButton({
    required this.model,
    this.size = 32,
    Key? key,
  }) : super(key: key);

  final SocialIcon model;
  final double size;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => launch(model.url),
      icon: Icon(
        model.icon,
        size: size,
        color: Colors.white,
      ),
    ).floatOnHover();
  }
}
