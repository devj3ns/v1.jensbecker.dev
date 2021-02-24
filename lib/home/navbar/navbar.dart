import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../extensions.dart';
import '../home.dart';

class NavBar extends StatelessWidget {
  const NavBar(this.scrollToSection);
  final Function(Section) scrollToSection;

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.w100);
    final spacerWith = 40.0;

    return Padding(
      padding: context.isMobile
          ? const EdgeInsets.symmetric(vertical: 10, horizontal: 15)
          : const EdgeInsets.symmetric(vertical: 30, horizontal: 60),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          InkWell(
            onTap: () => scrollToSection(Section.head),
            child: const Text(
              'Jens Becker',
              style: TextStyle(color: Colors.white, fontSize: 35),
            ),
          ).moveUpOnHover,
          if (context.isMobile) ...[
            const Expanded(child: SizedBox()),
            IconButton(
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.bars,
                color: Colors.white,
                size: 20,
              ),
            )
          ] else ...[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () => scrollToSection(Section.projects),
                    child: Text(
                      'Projekte',
                      style: textStyle,
                    ),
                  ).moveUpOnHover,
                  SizedBox(width: spacerWith),
                  InkWell(
                    onTap: () => scrollToSection(Section.tools),
                    child: Text(
                      'Tools',
                      style: textStyle,
                    ),
                  ).moveUpOnHover,
                  SizedBox(width: spacerWith),
                  InkWell(
                    onTap: () => scrollToSection(Section.contact),
                    child: Text(
                      'Kontakt',
                      style: textStyle,
                    ),
                  ).moveUpOnHover,
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
