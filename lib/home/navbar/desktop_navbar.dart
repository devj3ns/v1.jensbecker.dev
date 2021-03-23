import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../shared/extensions.dart';
import '../home.dart';
import 'language_selection.dart';

class DesktopNavBar extends StatelessWidget {
  const DesktopNavBar(this.scrollToSection);
  final Function(Section) scrollToSection;

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.w100);
    final spacerWith = context.isTablet ? 30.0 : 40.0;

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        const Text(
          'Jens Becker',
          style: TextStyle(color: Colors.white, fontSize: 35),
        ),
        const Expanded(child: SizedBox()),
        InkWell(
          onTap: () => scrollToSection(Section.projects),
          child: Text(
            tr('navbar_projects'),
            style: textStyle,
          ),
        ).floatOnHover(),
        SizedBox(width: spacerWith),
        InkWell(
          onTap: () => scrollToSection(Section.about),
          child: Text(
            tr('navbar_about-me'),
            style: textStyle,
          ),
        ).floatOnHover(),
        SizedBox(width: spacerWith),
        InkWell(
          onTap: () => scrollToSection(Section.tools),
          child: Text(
            tr('navbar_tools'),
            style: textStyle,
          ),
        ).floatOnHover(),
        SizedBox(width: spacerWith),
        InkWell(
          onTap: () => scrollToSection(Section.contact),
          child: Text(
            tr('navbar_contact'),
            style: textStyle,
          ),
        ).floatOnHover(),
        const Expanded(child: SizedBox()),
        LanguageSelection(
          textColor: Colors.white,
          dropdownColor: Theme.of(context).primaryColor,
        ),
      ],
    );
  }
}
