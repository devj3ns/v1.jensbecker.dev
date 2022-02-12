import 'package:easy_localization/easy_localization.dart';
import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';

import '../../../shared/widgets/widgets.dart';
import 'data/tools.dart';
import 'widgets/tool_icon.dart';

class ToolsSection extends StatelessWidget {
  const ToolsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final twoRows = context.byFormFactor<bool>(
      onMobile: true,
      onTablet: true,
      onDesktop: false,
    );
    final margin = EdgeInsets.symmetric(
      horizontal: context.byFormFactor<double>(
        onMobile: 0,
        onTablet: 100,
        onDesktop: context.screenWidth < 1250 ? 0 : context.screenWidth * 0.15,
      ),
    );

    final toolIconWidgets = tools.map(ToolIcon.new).toList();

    return Section(
      title: context.formFactor().isMobile
          ? tr('tools_section_title_mobile')
          : tr('tools_section_title'),
      subtitle: tr('tools_section_subtitle'),
      child: Box(
        margin: margin,
        shadow: true,
        child: twoRows
            ? Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        toolIconWidgets.sublist(0, toolIconWidgets.length ~/ 2),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: toolIconWidgets.sublist(
                        toolIconWidgets.length ~/ 2, toolIconWidgets.length),
                  ),
                ],
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: toolIconWidgets,
              ),
      ),
    );
  }
}
