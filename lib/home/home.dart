import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../shared/extensions.dart';
import 'footer/footer.dart';
import 'sections/sections.dart';

enum Section { head, projects, about, tools, contact }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AutoScrollController controller;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    controller = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: Axis.vertical,
    );
    _scrollController = ScrollController();
  }

  void scrollCallBack(DragUpdateDetails dragUpdate) {
    setState(() {
      // Note: 3.5 represents the theoretical height of all my scrollable content. This number will vary for you.
      _scrollController.position.moveTo(dragUpdate.globalPosition.dy * 3.5);
    });
  }

  void scrollToSection(Section section) async {
    await controller.scrollToIndex(section.index,
        preferPosition: AutoScrollPosition.begin);
  }

  @override
  Widget build(BuildContext context) {
    final sections = [
      AutoScrollTag(
        key: ValueKey(Section.head.index),
        index: Section.head.index,
        controller: controller,
        child: HeroSection(scrollToSection),
      ),
      AutoScrollTag(
        key: ValueKey(Section.projects.index),
        index: Section.projects.index,
        controller: controller,
        child: ProjectsSection(),
      ),
      AutoScrollTag(
        key: ValueKey(Section.about.index),
        index: Section.about.index,
        controller: controller,
        child: AboutSection(),
      ),
      AutoScrollTag(
        key: ValueKey(Section.tools.index),
        index: Section.tools.index,
        controller: controller,
        child: ToolsSection(),
      ),
      AutoScrollTag(
        key: ValueKey(Section.contact.index),
        index: Section.contact.index,
        controller: controller,
        child: ContactSection(),
      ),
      Footer(),
    ];

    return Scaffold(
      body: Scrollbar(
        isAlwaysShown: context.isDesktop,
        controller: controller,
        child: ListView.builder(
          controller: controller,
          itemCount: sections.length,
          itemBuilder: (context, index) => sections.elementAt(index),
        ),
      ),
    );
  }
}
