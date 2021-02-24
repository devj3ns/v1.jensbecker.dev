import 'package:flutter/material.dart';

import '../../extensions.dart';
import '../../tools/tools.dart';
import 'section.dart';

class ToolsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'Programmiersprachen & Tools',
      child: Wrap(
        spacing: 4.0,
        runSpacing: 4.0,
        children: tools.map((tool) => ToolIcon(tool).moveUpOnHover).toList(),
      ),
    );
  }
}
