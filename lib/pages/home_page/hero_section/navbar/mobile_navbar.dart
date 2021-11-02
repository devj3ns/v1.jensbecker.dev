import 'package:easy_localization/easy_localization.dart';
import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../home_page.dart';
import '../navbar/language_selection.dart';

class MobileNavBar extends StatelessWidget {
  const MobileNavBar(this.scrollToSection, {Key? key}) : super(key: key);
  final Function(SectionEnum) scrollToSection;

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
          onPressed: () =>
              context.pushPage(_MobileNavBarPopup(scrollToSection)),
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

class _MobileNavBarPopup extends StatelessWidget {
  const _MobileNavBarPopup(this.scrollToSection);
  final Function(SectionEnum) scrollToSection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Jens Becker',
                  style: TextStyle(color: Colors.black87, fontSize: 35),
                ),
                const Expanded(child: SizedBox()),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const FaIcon(
                    FontAwesomeIcons.times,
                    color: Colors.black87,
                    size: 33,
                  ),
                )
              ],
            ),
            const Expanded(child: SizedBox()),
            _MobileNavBarSectionButton(
              name: tr('navbar_projects'),
              section: SectionEnum.projects,
              scrollToSection: scrollToSection,
            ),
            _MobileNavBarSectionButton(
              name: tr('navbar_about-me'),
              section: SectionEnum.about,
              scrollToSection: scrollToSection,
            ),
            _MobileNavBarSectionButton(
              name: tr('navbar_tools'),
              section: SectionEnum.tools,
              scrollToSection: scrollToSection,
            ),
            _MobileNavBarSectionButton(
              name: tr('navbar_contact'),
              section: SectionEnum.contact,
              scrollToSection: scrollToSection,
            ),
            const Expanded(child: SizedBox()),
            const SizedBox(height: 15),
            const LanguageSelection(
              textColor: Colors.black,
              dropdownColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class _MobileNavBarSectionButton extends StatelessWidget {
  const _MobileNavBarSectionButton({
    required this.name,
    required this.section,
    required this.scrollToSection,
  });

  final String name;
  final SectionEnum section;
  final Function(SectionEnum) scrollToSection;

  @override
  Widget build(BuildContext context) {
    void popAndScroll() async {
      Navigator.of(context).pop();

      // It feels a bit more natural with this delay.
      await Future<void>.delayed(const Duration(milliseconds: 200));

      scrollToSection(section);
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextButton(
        onPressed: popAndScroll,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            name,
            style: const TextStyle(color: Colors.black87, fontSize: 23),
          ),
        ),
      ),
    );
  }
}
