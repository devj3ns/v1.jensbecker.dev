import 'package:flutter/material.dart';

import '../../extensions.dart';
import '../../tools/tools.dart';

class ToolsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 6, vertical: 75),
      child: Column(
        children: [
          const SelectableText(
            'Programmiersprachen & Tools',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 25),
          Wrap(
            spacing: 4.0,
            runSpacing: 4.0,
            children:
                tools.map((tool) => ToolIcon(tool).moveUpOnHover).toList(),
          ),
        ],
      ),
    );
  }
}
