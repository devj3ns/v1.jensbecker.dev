import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants.dart';
import '../model/social_icon.dart';

final socialIcons = <SocialIconData>[
  SocialIconData(
    icon: FontAwesomeIcons.github,
    link: Uri.parse(kGitHubLink),
  ),
  SocialIconData(
    icon: FontAwesomeIcons.twitter,
    link: Uri.parse(kTwitterLink),
  ),
  SocialIconData(
    icon: FontAwesomeIcons.instagram,
    link: Uri.parse(kInstagramLink),
  ),
  SocialIconData(
    icon: FontAwesomeIcons.envelope,
    link: Uri.parse(kEmailLink),
  ),
];
