import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../socials_row/socials_row.dart';
import '../home.dart';
import '../navbar/navbar.dart';

class HeroSection extends StatelessWidget {
  const HeroSection(this.scrollToSection);
  final Function(Section) scrollToSection;

  @override
  Widget build(BuildContext context) {
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
              Container(
                width: 300,
                height: 300,
                child: const CircleAvatar(
                  backgroundImage: NetworkImage(
                    'assets/icon.jpg',
                  ),
                  backgroundColor: Colors.transparent,
                ),
              ),
              const SizedBox(height: 20),
              SocialsRowWidget(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: IconButton(
              onPressed: () => scrollToSection(Section.projects),
              icon: FaIcon(
                FontAwesomeIcons.chevronDown,
                color: Colors.white.withOpacity(0.7),
                size: 40,
              ),
            ),
          )
        ],
      ),
    );
  }
}
