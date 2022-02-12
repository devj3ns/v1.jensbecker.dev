import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../shared/socials_row/socials_row.dart';
import '../../../shared/widgets/widgets.dart';
import '../home_page.dart';
import 'navbar/navbar.dart';

class HeroSection extends StatelessWidget {
  const HeroSection(this.scrollToSection, {Key? key}) : super(key: key);
  final Function(HomePageSection) scrollToSection;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight,
      decoration: const BoxDecoration(
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
                  onTap: () => scrollToSection(HomePageSection.about),
                  child: CircleAvatar(
                    radius: context.byFormFactor(
                      onMobile: 100,
                      onTablet: 125,
                      onDesktop: 150,
                      followDeviceOrientation: false,
                    ),
                    backgroundImage: const AssetImage(
                      'assets/images/jensbecker_small.jpg',
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
              const Gap.h16(),
              const AnimatedSocialsRow(),
            ],
          ),
          AnimateVerticalTranslate(
            duration: const Duration(milliseconds: 1000),
            child: MyIconButton(
              icon: FontAwesomeIcons.chevronDown,
              iconColor: Colors.white60,
              iconSize: 40,
              margin: const EdgeInsets.all(25.0),
              floatOnHover: false,
              onPressed: () => scrollToSection(HomePageSection.projects),
            ),
          ),
        ],
      ),
    );
  }
}
