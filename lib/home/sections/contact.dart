import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../extensions.dart';
import 'section.dart';

class ContactSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'Kontakt',
      child: ElevatedButton(
        child: const Text('E-Mail schreiben'),
        onPressed: () => launch('mailto:info@jensbecker.dev'),
      ).moveUpOnHover,
    );
  }
}
