import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../shared/extensions.dart';
import '../../shared/shared_widgets.dart';
import '../home.dart';
import '../navbar/navbar.dart';
import '../socials_row/socials_row.dart';

class HeroSection extends StatelessWidget {
  const HeroSection(this.scrollToSection);
  final Function(Section) scrollToSection;

  @override
  Widget build(BuildContext context) {
    final pictureSize = context.isMobile ? 200.0 : 300.0;

    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        // Fallback color, which is used as background color
        // when the image is not yet loaded:
        color: Color.fromRGBO(50, 11, 65, 1),
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
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
                      backgroundImage: AssetImage(
                        'assets/images/jensbecker_small.jpg',
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              AnimatedSocialsRow(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: AnimateVerticalTranslate(
              duration: const Duration(milliseconds: 1000),
              child: IconButton(
                onPressed: () => scrollToSection(Section.projects),
                icon: const FaIcon(
                  FontAwesomeIcons.chevronDown,
                  color: Colors.white60,
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
