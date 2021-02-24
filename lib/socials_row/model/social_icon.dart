import 'package:flutter/widgets.dart';

class SocialIcon {
  const SocialIcon({
    @required this.icon,
    @required this.url,
  });

  final IconData icon;
  final String url;
}

class CursorType {
  const CursorType._(this._value);

  final String _value;

  static const initial = CursorType._('initial');
  static const pointer = CursorType._('pointer');

  @override
  String toString() {
    return _value;
  }
}
