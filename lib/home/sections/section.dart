import 'package:flutter/material.dart';

import '../../extensions.dart';

class Section extends StatelessWidget {
  Section({@required this.title, @required this.child});
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.isMobile
          ? const EdgeInsets.symmetric(horizontal: 15, vertical: 25)
          : EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 6, vertical: 75),
      child: Column(
        children: [
          SelectableText(
            title,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 25),
          child,
        ],
      ),
    );
  }
}
