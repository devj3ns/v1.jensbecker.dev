import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/home/navbar/language_selection.dart';

import '../home.dart';

class MobileNavBar extends StatelessWidget {
  const MobileNavBar(this.scrollToSection);
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
          onPressed: () => Navigator.push<void>(
            context,
            MaterialPageRoute(
              builder: (context) => _MobileNavBarPopup(scrollToSection),
            ),
          ),
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
  final Function(Section) scrollToSection;

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
              section: Section.projects,
              scrollToSection: scrollToSection,
            ),
            _MobileNavBarSectionButton(
              name: tr('navbar_about-me'),
              section: Section.about,
              scrollToSection: scrollToSection,
            ),
            _MobileNavBarSectionButton(
              name: tr('navbar_tools'),
              section: Section.tools,
              scrollToSection: scrollToSection,
            ),
            _MobileNavBarSectionButton(
              name: tr('navbar_contact'),
              section: Section.contact,
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
  final Section section;
  final Function(Section) scrollToSection;

  @override
  Widget build(BuildContext context) {
    void popAndScroll() async {
      Navigator.of(context).pop();

      // it feels more natural with the delay
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
