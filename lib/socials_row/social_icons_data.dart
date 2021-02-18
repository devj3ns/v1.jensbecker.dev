import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContentViewModel {
  const ContentViewModel({
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

const personalSocialMediaData = <ContentViewModel>[
  ContentViewModel(
    icon: FontAwesomeIcons.github,
    url: 'https://github.com/devj3ns',
  ),
  ContentViewModel(
    icon: FontAwesomeIcons.twitter,
    url: 'https://twitter.com/devj3ns',
  ),
  ContentViewModel(
    icon: FontAwesomeIcons.instagram,
    url: 'https://instagram.com/dev.j3ns',
  ),
  ContentViewModel(
    icon: FontAwesomeIcons.envelope,
    url: 'mailto:info@jensbecker.dev',
  ),
];
