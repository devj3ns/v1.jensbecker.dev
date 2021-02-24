import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/tool.dart';

class ToolIcon extends StatelessWidget {
  const ToolIcon(this.tool, {this.size = 100});
  final Tool tool;
  final double size;

  void openLink() {
    launch(tool.link);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Card(
        child: InkWell(
          onTap: openLink,
          child: Image.network(tool.iconUrl),
        ),
      ),
    );
  }
}
