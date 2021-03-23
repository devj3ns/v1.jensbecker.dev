import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../shared/extensions.dart';
import '../../shared/shared_widgets.dart';
import '../section.dart';
import '../tools/tools.dart';

class ToolsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Section(
      title: context.isMobile
          ? tr('tools_section_title_mobile')
          : tr('tools_section_title'),
      subtitle: tr('tools_section_subtitle'),
      child: ShadowBox(
        child: context.responsiveWidget(
          onMobile: _MobileTools(),
          onTablet: _TabletTools(),
          onDesktop: _DesktopTools(),
        ),
      ),
    );
  }
}

class _DesktopTools extends StatelessWidget {
  final toolIconWidgets = tools.map((tool) => ToolIcon(tool)).toList();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: toolIconWidgets,
    );
  }
}

class _TabletTools extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final toolIconWidgets =
        tools.map((tool) => ToolIcon(tool, size: 110)).toList();

    final partOne = toolIconWidgets.sublist(0, toolIconWidgets.length ~/ 2);
    final partTwo = toolIconWidgets.sublist(
        toolIconWidgets.length ~/ 2, toolIconWidgets.length);

    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: partOne,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: partTwo,
        ),
      ],
    );
  }
}

class _MobileTools extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final iconSize = (context.screenWidth / 4.5).clamp(0, 110).toDouble();

    final toolIconWidgets =
        tools.map((tool) => ToolIcon(tool, size: iconSize)).toList();

    final partOne = toolIconWidgets.sublist(0, toolIconWidgets.length ~/ 2);
    final partTwo = toolIconWidgets.sublist(
        toolIconWidgets.length ~/ 2, toolIconWidgets.length);

    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: partOne,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: partTwo,
        ),
      ],
    );
  }
}
