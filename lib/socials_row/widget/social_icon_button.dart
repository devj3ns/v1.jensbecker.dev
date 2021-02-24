import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../extensions.dart';
import '../model/social_icon.dart';

class SocialIconButton extends StatelessWidget {
  const SocialIconButton({
    @required this.model,
    this.size,
    this.onTap,
  });

  final SocialIcon model;
  final double size;
  final VoidCallback onTap;

  void _onTap() {
    if (onTap != null) {
      onTap();
      return;
    }

    if (model.url != null) {
      launch(model.url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _onTap,
      icon: Icon(
        model.icon,
        size: size,
        color: Colors.white,
      ),
    ).moveUpOnHover;
  }
}
