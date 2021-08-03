import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fleasy/fleasy.dart';

import '../../../../shared/shared_widgets.dart';
import '../../home_page.dart';
import 'language_selection.dart';

class DesktopNavBar extends StatelessWidget {
  const DesktopNavBar(this.scrollToSection, {Key? key}) : super(key: key);
  final Function(SectionEnum) scrollToSection;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.w100);
    final spacerWith = context.formFactor == FormFactor.handset ? 30.0 : 40.0;

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        const Text(
          'Jens Becker',
          style: TextStyle(color: Colors.white, fontSize: 35),
        ),
        const Expanded(child: SizedBox()),
        InkWell(
          onTap: () => scrollToSection(SectionEnum.projects),
          child: Text(
            tr('navbar_projects'),
            style: textStyle,
          ),
        ).floatOnHover(),
        SizedBox(width: spacerWith),
        InkWell(
          onTap: () => scrollToSection(SectionEnum.about),
          child: Text(
            tr('navbar_about-me'),
            style: textStyle,
          ),
        ).floatOnHover(),
        SizedBox(width: spacerWith),
        InkWell(
          onTap: () => scrollToSection(SectionEnum.tools),
          child: Text(
            tr('navbar_tools'),
            style: textStyle,
          ),
        ).floatOnHover(),
        SizedBox(width: spacerWith),
        InkWell(
          onTap: () => scrollToSection(SectionEnum.contact),
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
