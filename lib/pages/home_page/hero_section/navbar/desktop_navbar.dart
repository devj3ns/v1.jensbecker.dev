import 'package:easy_localization/easy_localization.dart';
import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';

import '../../../../shared/extensions.dart';
import '../../home_page.dart';
import 'language_selection.dart';

class DesktopNavBar extends StatelessWidget {
  const DesktopNavBar(this.scrollToSection, {Key? key}) : super(key: key);
  final Function(HomePageSection) scrollToSection;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Use SizedBox to make sure that the links are always centered properly
        SizedBox(
          width: context.formFactor().isDesktop ? 250 : 100,
          child: Text(
            context.formFactor().isDesktop ? 'Jens Becker' : 'JB',
            style: const TextStyle(color: Colors.white, fontSize: 35),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _NavBarLink(
                text: tr('navbar_projects'),
                onTap: () => scrollToSection(HomePageSection.projects),
              ),
              _NavBarLink(
                text: tr('navbar_about-me'),
                onTap: () => scrollToSection(HomePageSection.about),
              ),
              _NavBarLink(
                text: tr('navbar_tools'),
                onTap: () => scrollToSection(HomePageSection.tools),
              ),
              _NavBarLink(
                text: tr('navbar_contact'),
                onTap: () => scrollToSection(HomePageSection.contact),
              ),
            ],
          ),
        ),
        // Use SizedBox to make sure that the links are always centered properly
        SizedBox(
          width: context.formFactor().isDesktop ? 250 : 100,
          child: Align(
            alignment: Alignment.centerRight,
            child: LanguageSelection(
              textColor: Colors.white,
              dropdownColor: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}

class _NavBarLink extends StatelessWidget {
  const _NavBarLink({
    required this.text,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.01),
      child: InkWell(
        onTap: onTap,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w100,
          ),
        ),
      ).floatOnHover(),
    );
  }
}
