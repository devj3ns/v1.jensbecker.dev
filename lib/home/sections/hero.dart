import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../animate.dart';
import '../../extensions.dart';
import '../../socials_row/socials_row.dart';
import '../home.dart';
import '../navbar/navbar.dart';

class HeroSection extends StatelessWidget {
  const HeroSection(this.scrollToSection);
  final Function(Section) scrollToSection;

  @override
  Widget build(BuildContext context) {
    final pictureSize = context.isMobile ? 200.0 : 300.0;

    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('assets/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          NavBar(scrollToSection),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimateScale(
                child: InkWell(
                  onTap: () => scrollToSection(Section.about),
                  child: SizedBox(
                    width: pictureSize,
                    height: pictureSize,
                    child: const CircleAvatar(
                      backgroundImage: NetworkImage(
                        'assets/icon.jpg',
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SocialsRowWidget(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: AnimateTranslate(
              child: IconButton(
                onPressed: () => scrollToSection(Section.projects),
                icon: FaIcon(
                  FontAwesomeIcons.chevronDown,
                  color: Colors.white.withOpacity(0.7),
                  size: 40,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
