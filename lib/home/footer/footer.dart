import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';

import '../../locations.dart';
import '../../shared/extensions.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(fontSize: 17, color: Colors.blueGrey[200]);

    return ColoredBox(
      color: Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: context.responsiveNumber(
            onMobile: 5,
            onTablet: 30,
            onDesktop: 80,
          ),
          children: [
            TextButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '© Jens Becker ${DateTime.now().year}',
                  style: textStyle,
                ),
              ),
            ),
            TextButton(
              onPressed: () => context.beamTo(ImprintLocation()),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Impressum',
                  style: textStyle,
                ),
              ),
            ),
            TextButton(
              onPressed: () => context.beamTo(PrivacyLocation()),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Datenschutz',
                  style: textStyle,
                ),
              ),
            ),
            TextButton(
              onPressed: () => context.beamTo(LicenceLocation()),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Lizenzen',
                  style: textStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
