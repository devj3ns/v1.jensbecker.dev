import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../shared/shared_widgets.dart';
import '../models/tool.dart';

class ToolIcon extends StatelessWidget {
  const ToolIcon(this.tool, {this.size = 100, Key? key}) : super(key: key);
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
      child: RoundedClickBox(
        borderRadius: 10.0,
        margin: const EdgeInsets.all(6.0),
        padding: const EdgeInsets.all(15.0),
        onPressed: openLink,
        child: Image.asset(tool.iconUrl),
      ),
    );
  }
}
