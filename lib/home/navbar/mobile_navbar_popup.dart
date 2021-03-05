import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../home.dart';

class MobileNavBarPopup extends StatelessWidget {
  const MobileNavBarPopup(this.scrollToSection);
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
            _SectionButton(
              name: 'Projekte',
              section: Section.projects,
              scrollToSection: scrollToSection,
            ),
            _SectionButton(
              name: 'Über mich',
              section: Section.about,
              scrollToSection: scrollToSection,
            ),
            _SectionButton(
              name: 'Tools',
              section: Section.tools,
              scrollToSection: scrollToSection,
            ),
            _SectionButton(
              name: 'Kontakt',
              section: Section.contact,
              scrollToSection: scrollToSection,
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}

class _SectionButton extends StatelessWidget {
  const _SectionButton({
    @required this.name,
    @required this.section,
    @required this.scrollToSection,
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
