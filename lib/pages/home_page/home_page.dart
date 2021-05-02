import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:easy_localization/easy_localization.dart';

import 'about_section/about_sections.dart';
import 'contact_section/contact_section.dart';
import 'footer/footer.dart';
import 'hero_section/hero_section.dart';
import 'projects_section/projects_section.dart';
import 'tools_section/tools_section.dart';

enum SectionEnum { projects, about, tools, contact }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AutoScrollController scrollController;

  @override
  void initState() {
    scrollController = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: Axis.vertical,
    );
    super.initState();
  }

  void scrollToSection(SectionEnum section) async {
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
    // todo: When https://github.com/slovnicki/beamer/issues/232 is done the SimpleLocationBuilder
    // todo: has to be updated like explained here: https://github.com/slovnicki/beamer/issues/239.
    //
    // This is just a workaround:
    final locale = context.locale;

    final sections = [
      HeroSection(scrollToSection),
      AutoScrollTag(
        key: ValueKey(SectionEnum.projects.index),
        index: SectionEnum.projects.index,
        controller: scrollController,
        child: ProjectsSection(),
      ),
      AutoScrollTag(
        key: ValueKey(SectionEnum.about.index),
        index: SectionEnum.about.index,
        controller: scrollController,
        child: AboutSection(),
      ),
      AutoScrollTag(
        key: ValueKey(SectionEnum.tools.index),
        index: SectionEnum.tools.index,
        controller: scrollController,
        child: ToolsSection(),
      ),
      AutoScrollTag(
        key: ValueKey(SectionEnum.contact.index),
        index: SectionEnum.contact.index,
        controller: scrollController,
        child: ContactSection(),
      ),
      Footer(),
    ];

    return Scaffold(
      body: ListView.builder(
        controller: scrollController,
        itemCount: sections.length,
        itemBuilder: (context, index) => sections.elementAt(index),
      ),
    );

    // I removed the scrollbar because on mobile it had some problems with the textfield
    // and it did not work that well on desktop too (see https://github.com/flutter/flutter/issues/25652)
    /*return Scaffold(
      body: Scrollbar(
        isAlwaysShown: context.isDesktop,
        controller: scrollController,
        child: ListView.builder(
          controller: scrollController,
          itemCount: sections.length,
          itemBuilder: (context, index) => sections.elementAt(index),
        ),
      ),
    );*/
  }
}
