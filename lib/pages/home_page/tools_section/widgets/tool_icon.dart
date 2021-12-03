import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';

import '../../../../shared/shared_widgets.dart';
import '../models/tool_data.dart';

class ToolIcon extends StatelessWidget {
  const ToolIcon(this.toolData, {Key? key}) : super(key: key);
  final ToolData toolData;

  @override
  Widget build(BuildContext context) {
    final maxIconSize = context.byFormFactor<double>(
      onHandset: 100,
      onTablet: 100,
      onDesktop: 90,
    );

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: maxIconSize,
        maxHeight: maxIconSize,
      ),
      child: RoundedBox(
        borderRadius: 10.0,
        margin: const EdgeInsets.all(6.0),
        padding: const EdgeInsets.all(15.0),
        link: toolData.link,
        //onPressed: openLink,
        child: Image.asset(toolData.iconUrl),
      ),
    );
  }
}
