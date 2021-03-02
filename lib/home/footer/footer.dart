import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';

import '../../locations.dart';
import '../../shared/extensions.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textStyle =
        TextStyle(fontSize: 17, color: Colors.blueGrey.withOpacity(0.6));

    return ColoredBox(
      color: Colors.grey.withOpacity(0.1),
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '© Jens Becker ${DateTime.now().year}',
                  style: textStyle,
                ),
              ),
              onPressed: () {},
            ),
            TextButton(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Impressum',
                  style: textStyle,
                ),
              ),
              onPressed: () => context.beamTo(ImprintLocation()),
            ),
            TextButton(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Datenschutz',
                  style: textStyle,
                ),
              ),
              onPressed: () => context.beamTo(PrivacyLocation()),
            ),
            TextButton(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Lizenzen',
                  style: textStyle,
                ),
              ),
              onPressed: () => context.beamTo(LicenceLocation()),
            ),
          ],
        ),
      ),
    );
  }
}
