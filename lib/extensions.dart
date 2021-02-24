import 'package:flutter/material.dart';

extension DarkMode on BuildContext {
  bool get isDarkMode =>
      Theme.of(this).brightness == Brightness.dark ? true : false;

  bool get isLightMode => !isDarkMode;
}

class TranslateOnHover extends StatefulWidget {
  TranslateOnHover({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  _TranslateOnHoverState createState() => _TranslateOnHoverState();
}

class _TranslateOnHoverState extends State<TranslateOnHover> {
  final nonHoverTransform = Matrix4.identity()..translate(0, 0, 0);
  final hoverTransform = Matrix4.identity()..translate(0, -8, 0);

  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: widget.child,
        transform: _hovering ? hoverTransform : nonHoverTransform,
      ),
    );
  }

  void _mouseEnter(bool hover) {
    setState(() {
      _hovering = hover;
    });
  }
}

extension X on Widget {
  Widget get moveUpOnHover {
    return TranslateOnHover(
      child: this,
    );
  }
}
