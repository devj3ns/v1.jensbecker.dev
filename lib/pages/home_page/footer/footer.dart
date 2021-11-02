import 'package:beamer/beamer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(fontSize: 17, color: Colors.blueGrey[200]);

    return ColoredBox(
      color: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: context.byFormFactor<double>(
            onHandset: 5,
            onTablet: 30,
            onDesktop: 80,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '© Jens Becker ${DateTime.now().year}',
                style: textStyle.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              onPressed: () => context.beamToNamed('/impressum'),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  tr('footer_imprint'),
                  style: textStyle,
                ),
              ),
            ),
            TextButton(
              onPressed: () => context.beamToNamed('/datenschutz'),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  tr('footer_privacy'),
                  style: textStyle,
                ),
              ),
            ),
            TextButton(
              onPressed: () => context.beamToNamed('/lizenzen'),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  tr('footer_licences'),
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
