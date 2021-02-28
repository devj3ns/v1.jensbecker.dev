import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../shared/extensions.dart';
import '../home.dart';
import 'mobile_navbar_popup.dart';

class NavBar extends StatelessWidget {
  const NavBar(this.scrollToSection);
  final Function(Section) scrollToSection;

  @override
  Widget build(BuildContext context) {
    final margin = context.responsiveEdgeInsets(
      onMobile: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      onTablet: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      onDesktop: const EdgeInsets.symmetric(vertical: 30, horizontal: 60),
    );

    return Padding(
      padding: margin,
      child: context.isMobile
          ? _MobileNavBar(scrollToSection)
          : _NavBar(scrollToSection),
    );
  }
}

class _MobileNavBar extends StatelessWidget {
  const _MobileNavBar(this.scrollToSection);
  final Function(Section) scrollToSection;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        const Text(
          'Jens Becker',
          style: TextStyle(color: Colors.white, fontSize: 35),
        ),
        const Expanded(child: SizedBox()),
        IconButton(
          onPressed: () {
            Navigator.push<void>(
              context,
              MaterialPageRoute(
                builder: (context) => MobileNavBarPopup(scrollToSection),
              ),
            );
          },
          icon: const FaIcon(
            FontAwesomeIcons.bars,
            color: Colors.white,
            size: 30,
          ),
        ),
      ],
    );
  }
}

class _NavBar extends StatelessWidget {
  const _NavBar(this.scrollToSection);
  final Function(Section) scrollToSection;

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.w100);
    final spacerWith = context.isTablet ? 30.0 : 40.0;

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        InkWell(
          onTap: () => scrollToSection(Section.head),
          child: const Text(
            'Jens Becker',
            style: TextStyle(color: Colors.white, fontSize: 35),
          ),
        ),
        const Expanded(child: SizedBox()),
        InkWell(
          onTap: () => scrollToSection(Section.projects),
          child: Text(
            'Projekte',
            style: textStyle,
          ),
        ).floatOnHover(),
        SizedBox(width: spacerWith),
        InkWell(
          onTap: () => scrollToSection(Section.about),
          child: Text(
            'Über mich',
            style: textStyle,
          ),
        ).floatOnHover(),
        SizedBox(width: spacerWith),
        InkWell(
          onTap: () => scrollToSection(Section.tools),
          child: Text(
            'Tools',
            style: textStyle,
          ),
        ).floatOnHover(),
        SizedBox(width: spacerWith),
        InkWell(
          onTap: () => scrollToSection(Section.contact),
          child: Text(
            'Kontakt',
            style: textStyle,
          ),
        ).floatOnHover(),
      ],
    );
  }
}
