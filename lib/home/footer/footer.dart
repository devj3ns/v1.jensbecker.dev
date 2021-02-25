import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.grey.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SelectableText(
              '© Jens Becker ${DateTime.now().year}',
              style: const TextStyle(fontSize: 20, color: Colors.blueGrey),
            ),
          ],
        ),
      ),
    );
  }
}
