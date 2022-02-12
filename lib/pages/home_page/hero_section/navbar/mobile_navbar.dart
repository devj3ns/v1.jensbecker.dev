import 'package:easy_localization/easy_localization.dart';
import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';

import '../../../../shared/widgets/widgets.dart';
import '../../home_page.dart';
import '../navbar/language_selection.dart';

class MobileNavBar extends StatelessWidget {
  const MobileNavBar(this.scrollToSection, {Key? key}) : super(key: key);
  final Function(HomePageSection) scrollToSection;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Jens Becker',
          style: TextStyle(color: Colors.white, fontSize: 35),
        ),
        MyIconButton(
          icon: Icons.menu_rounded,
          onPressed: () =>
              context.pushPage(_MobileNavBarPopup(scrollToSection)),
        ),
      ],
    );
  }
}

class _MobileNavBarPopup extends StatelessWidget {
  const _MobileNavBarPopup(this.scrollToSection);
  final Function(HomePageSection) scrollToSection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Jens Becker',
                  style: TextStyle(color: Colors.black87, fontSize: 35),
                ),
                MyIconButton(
                  icon: Icons.close_rounded,
                  iconColor: Colors.black87,
                  onPressed: () => context.popPage(),
                )
              ],
            ),
            Column(
              children: [
                _SectionButton(
                  name: tr('navbar_projects'),
                  section: HomePageSection.projects,
                  scrollToSection: scrollToSection,
                ),
                _SectionButton(
                  name: tr('navbar_about-me'),
                  section: HomePageSection.about,
                  scrollToSection: scrollToSection,
                ),
                _SectionButton(
                  name: tr('navbar_tools'),
                  section: HomePageSection.tools,
                  scrollToSection: scrollToSection,
                ),
                _SectionButton(
                  name: tr('navbar_contact'),
                  section: HomePageSection.contact,
                  scrollToSection: scrollToSection,
                ),
              ],
            ),
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

class _SectionButton extends StatelessWidget {
  const _SectionButton({
    required this.name,
    required this.section,
    required this.scrollToSection,
  });

  final String name;
  final HomePageSection section;
  final Function(HomePageSection) scrollToSection;

  @override
  Widget build(BuildContext context) {
    void popAndScroll() async {
      context.popPage();

      // With this delay it feels more natural:
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
