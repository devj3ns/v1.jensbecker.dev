import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../extensions.dart';
import 'social_icons_data.dart';

class SocialIconButton extends StatefulWidget {
  const SocialIconButton({
    @required this.model,
    this.size,
    this.onTap,
  });

  final ContentViewModel model;
  final double size;
  final VoidCallback onTap;

  @override
  _SocialIconButtonState createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<SocialIconButton> {
  bool _isHovering = false;

  void _onTap() {
    if (widget.onTap != null) {
      widget.onTap();
      return;
    }

    if (widget.model.url != null) {
      launch(widget.model.url);
    }
  }

  void _onPointerEnter(PointerEnterEvent event) {
    setState(() {
      _isHovering = true;
    });
  }

  void _onPointerExit(PointerExitEvent event) {
    setState(() {
      _isHovering = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: MaterialStateMouseCursor.clickable,
      onEnter: _onPointerEnter,
      onExit: _onPointerExit,
      child: GestureDetector(
        onTap: _onTap,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 150),
          opacity: _isHovering ? 1.0 : 0.4,
          child: Icon(
            widget.model.icon,
            size: widget.size,
            color: context.isInDarkMode ? Colors.white70 : Colors.black87,
          ),
        ),
      ),
    );
  }
}
