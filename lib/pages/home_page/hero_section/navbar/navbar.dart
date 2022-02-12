import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';

import '../../home_page.dart';
import 'desktop_navbar.dart';
import 'mobile_navbar.dart';

class NavBar extends StatelessWidget {
  const NavBar(this.scrollToSection, {Key? key}) : super(key: key);
  final Function(HomePageSection) scrollToSection;

  @override
  Widget build(BuildContext context) {
    final margin = context.byFormFactor<EdgeInsets>(
      onMobile: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      onTablet: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      onDesktop: const EdgeInsets.symmetric(vertical: 30, horizontal: 60),
    );

    return Padding(
      padding: margin,
      child: context.formFactor().isMobile
          ? MobileNavBar(scrollToSection)
          : DesktopNavBar(scrollToSection),
    );
  }
}
