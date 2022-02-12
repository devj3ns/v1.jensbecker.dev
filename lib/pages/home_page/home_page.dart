import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'about_section/about_sections.dart';
import 'contact_section/contact_section.dart';
import 'footer/footer.dart';
import 'hero_section/hero_section.dart';
import 'projects_section/projects_section.dart';
import 'tools_section/tools_section.dart';

enum HomePageSection { projects, about, tools, contact }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AutoScrollController scrollController;

  @override
  void initState() {
    scrollController = AutoScrollController();
    super.initState();
  }

  void scrollToSection(HomePageSection section) async {
    await scrollController.scrollToIndex(
      section.index,
      preferPosition: AutoScrollPosition.begin,
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sections = [
      HeroSection(scrollToSection),
      AutoScrollTag(
        key: ValueKey(HomePageSection.projects.index),
        index: HomePageSection.projects.index,
        controller: scrollController,
        child: const ProjectsSection(),
      ),
      AutoScrollTag(
        key: ValueKey(HomePageSection.about.index),
        index: HomePageSection.about.index,
        controller: scrollController,
        child: const AboutSection(),
      ),
      AutoScrollTag(
        key: ValueKey(HomePageSection.tools.index),
        index: HomePageSection.tools.index,
        controller: scrollController,
        child: const ToolsSection(),
      ),
      AutoScrollTag(
        key: ValueKey(HomePageSection.contact.index),
        index: HomePageSection.contact.index,
        controller: scrollController,
        child: const ContactSection(),
      ),
      const Footer(),
    ];

    return FutureBuilder(
      future: GoogleFonts.pendingFontLoads(),
      builder: (context, snapshot) {
        // Shows the splash screen until the fonts are loaded:
        if (snapshot.connectionState != ConnectionState.done) {
          return const SizedBox();
        }

        return Scaffold(
          body: ListView.builder(
            controller: scrollController,
            itemCount: sections.length,
            itemBuilder: (context, index) => sections.elementAt(index),
          ),
        );
      },
    );
  }
}
