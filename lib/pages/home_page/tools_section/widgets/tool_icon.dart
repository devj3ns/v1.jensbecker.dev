import 'package:flutter/material.dart';

import '../../../../shared/widgets/widgets.dart';
import '../models/tool.dart';

class ToolIcon extends StatelessWidget {
  const ToolIcon(this.tool, {Key? key}) : super(key: key);
  final Tool tool;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Box(
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        margin: const EdgeInsets.all(6.0),
        padding: const EdgeInsets.all(15.0),
        link: tool.link,
        child: Image.asset(tool.iconUrl),
      ),
    );
  }
}
