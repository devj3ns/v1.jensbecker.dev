import 'package:easy_localization/easy_localization.dart';
import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';

import '../../../shared/shared_widgets.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(fontSize: 17, color: Colors.blueGrey.shade200);

    return ColoredBox(
      color: Colors.grey.shade100,
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: context.byFormFactor<double>(
          onHandset: 5,
          onTablet: 30,
          onDesktop: 80,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '© Jens Becker ${DateTime.now().year}',
              style: textStyle.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          MyButton(
            link: Uri.parse('datenschutz'),
            label: tr('footer_privacy'),
            color: Colors.transparent,
            textStyle: textStyle,
          ),
          MyButton(
            link: Uri.parse('impressum'),
            label: tr('footer_imprint'),
            color: Colors.transparent,
            textStyle: textStyle,
          ),
          MyButton(
            link: Uri.parse('lizenzen'),
            label: tr('footer_licences'),
            color: Colors.transparent,
            textStyle: textStyle,
          ),
        ],
      ),
    );
  }
}
