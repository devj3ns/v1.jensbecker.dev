import 'package:flutter/material.dart';

import '../../shared/extensions.dart';
import '../../tools/tools.dart';
import '../section.dart';

class ToolsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'Programmiersprachen & Tools',
      subtitle:
          'Mit diesen Tools habe ich die letzten Jahre Erfahrung gesammelt.',
      child: Wrap(
        spacing: 4.0,
        runSpacing: 4.0,
        children: tools.map((tool) => ToolIcon(tool)).toList(),
      ),
    );
  }
}
