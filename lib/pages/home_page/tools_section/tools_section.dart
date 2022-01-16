import 'package:easy_localization/easy_localization.dart';
import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';

import '../../../shared/shared_widgets.dart';
import 'data/tools.dart';
import 'widgets/tool_icon.dart';

class ToolsSection extends StatelessWidget {
  const ToolsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final twoRows = context.byFormFactor<bool>(
      onHandset: true,
      onTablet: true,
      onDesktop: false,
    );

    final toolIconWidgets = tools.map(ToolIcon.new).toList();

    return Section(
      title: context.formFactor == FormFactor.handset
          ? tr('tools_section_title_mobile')
          : tr('tools_section_title'),
      subtitle: tr('tools_section_subtitle'),
      child: RoundedBox(
        shadow: true,
        color: Colors.transparent,
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
